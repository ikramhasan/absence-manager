import 'dart:convert';
import 'dart:io';
import 'package:absence_manager/features/absence/infrastructure/local_absence_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_absence_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<File>()])
void main() {
  late LocalAbsenceRepository repository;
  late MockFile memberFile;
  late MockFile absenceFile;

  setUp(() {
    memberFile = MockFile();
    absenceFile = MockFile();
    repository = LocalAbsenceRepository(
      memberFile: memberFile,
      absenceFile: absenceFile,
    );
  });

  final absenceJson = jsonEncode({
    'message': 'Success',
    'payload': [
      {
        'id': 1,
        'userId': 1,
        'admitterNote': 'Note',
        'createdAt': '2023-01-01T00:00:00.000Z',
        'crewId': 1,
        'startDate': '2023-01-01T00:00:00.000Z',
        'endDate': '2023-01-01T00:00:00.000Z',
        'type': 'sickness',
        'memberNote': 'Note',
      },
    ],
  });

  final userJson = jsonEncode({
    'message': 'Success',
    'payload': [
      {
        'id': 1,
        'crewId': 1,
        'image': 'image',
        'userId': 1,
        'name': 'John',
      },
    ],
  });

  group('LocalAbsenceRepository', () {
    test('fetchAbsencesWithMembers returns list of absences with users',
        () async {
      // Arrange

      when(absenceFile.readAsString()).thenAnswer((_) async => absenceJson);
      when(memberFile.readAsString()).thenAnswer((_) async => userJson);

      // Act
      final result = await repository.fetchAbsencesWithMembers();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected right but got left'),
        (absences) {
          expect(absences.length, 1);
          expect(absences.first.user?.name, 'John');
        },
      );
    });

    test('fetchAbsencesWithMembers returns UserNotFoundException', () async {
      // Arrange
      final userJsonWithAnotherID = jsonEncode({
        'message': 'Success',
        'payload': [
          {
            'id': 1,
            'crewId': 1,
            'image': 'image',
            'userId': 99,
            'name': 'John',
          },
        ],
      });

      when(absenceFile.readAsString()).thenAnswer((_) async => absenceJson);
      when(memberFile.readAsString())
          .thenAnswer((_) async => userJsonWithAnotherID);

      // Act
      final result = await repository.fetchAbsencesWithMembers();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure.code, 404);
          expect(failure.message, 'User not found.');
        },
        (_) => fail('Expected left but got right'),
      );
    });

    test('fetchAbsencesWithMembers returns general exception', () async {
      // Arrange
      when(memberFile.readAsString()).thenThrow(Exception('File read error'));

      // Act
      final result = await repository.fetchAbsencesWithMembers();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure.code, 500);
          expect(failure.message, 'Failed to fetch absences.');
        },
        (_) => fail('Expected left but got right'),
      );
    });

    test('readAbsences returns list of absences', () async {
      // Arrange
      when(absenceFile.readAsString()).thenAnswer((_) async => absenceJson);

      // Act
      final result = await repository.readAbsences();

      // Assert
      expect(result.length, 1);
      expect(result.first.userId, 1);
    });

    test('readUsers returns list of users', () async {
      // Arrange

      when(memberFile.readAsString()).thenAnswer((_) async => userJson);

      // Act
      final result = await repository.readUsers();

      // Assert
      expect(result.length, 1);
      expect(result.first.userId, 1);
    });
  });
}

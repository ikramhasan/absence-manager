import 'dart:convert';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('Absence', () {
    test('should create an Absence instance using the factory constructor', () {
      final absence = Absence(
        admitterNote: 'Admitter Note',
        createdAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
        crewId: 1,
        startDate: DateTime.parse('2023-01-02T00:00:00.000Z'),
        endDate: DateTime.parse('2023-01-03T00:00:00.000Z'),
        rejectedAt: DateTime.parse('2023-01-04T00:00:00.000Z'),
        id: 1,
        memberNote: 'Member Note',
        userId: 1,
        type: Type.sickness,
      );

      expect(absence.admitterNote, 'Admitter Note');
      expect(absence.createdAt, DateTime.parse('2023-01-01T00:00:00.000Z'));
      expect(absence.crewId, 1);
      expect(absence.startDate, DateTime.parse('2023-01-02T00:00:00.000Z'));
      expect(absence.endDate, DateTime.parse('2023-01-03T00:00:00.000Z'));
      expect(absence.id, 1);
      expect(absence.memberNote, 'Member Note');
      expect(absence.userId, 1);
      expect(absence.type, Type.sickness);
    });

    test('should create an absence with an user if user is present', () {
      const user = User(
        id: 1,
        crewId: 1,
        name: 'John Doe',
        image: 'https://example.com/image.jpg',
        userId: 1,
      );

      final absence = Absence(
        admitterNote: 'Admitter Note',
        createdAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
        crewId: 1,
        startDate: DateTime.parse('2023-01-02T00:00:00.000Z'),
        endDate: DateTime.parse('2023-01-03T00:00:00.000Z'),
        rejectedAt: DateTime.parse('2023-01-04T00:00:00.000Z'),
        id: 1,
        memberNote: 'Member Note',
        userId: 1,
        type: Type.sickness,
        user: user,
      );
      final json = absence.toJson();
      expect(json['user'], user.toJson());
      expect(absence.user, user);
      expect(Absence.fromJson(json).user, user);
    });

    test('should create an Absence instance from JSON', () async {
      final jsonMap =
          json.decode(fixture('absence.json')) as Map<String, dynamic>;
      final absence = Absence.fromJson(jsonMap);

      expect(absence.admitterNote, jsonMap['admitterNote']);
      expect(
        absence.createdAt,
        DateTime.parse(jsonMap['createdAt'].toString()),
      );
      expect(absence.crewId, jsonMap['crewId']);
      expect(
        absence.startDate,
        DateTime.parse(jsonMap['startDate'].toString()),
      );
      expect(absence.endDate, DateTime.parse(jsonMap['endDate'].toString()));
      expect(
        absence.rejectedAt,
        DateTime.parse(jsonMap['rejectedAt'].toString()),
      );
      expect(absence.id, jsonMap['id']);
      expect(absence.memberNote, jsonMap['memberNote']);
      expect(absence.userId, jsonMap['userId']);
      expect(
        absence.type,
        Type.values
            .firstWhere((e) => e.toString() == 'Type.${jsonMap['type']}'),
      );
      expect(
        absence.rejectedAt,
        jsonMap['rejectedAt'] != null
            ? DateTime.parse(jsonMap['rejectedAt'].toString())
            : null,
      );
      expect(absence.admitterId, jsonMap['admitterId']);
      expect(
        absence.confirmedAt,
        jsonMap['confirmedAt'] != null
            ? DateTime.parse(jsonMap['confirmedAt'].toString())
            : null,
      );
    });

    test('fromJson should create an absence with a user', () {});

    test('should create an empty Absence instance', () {
      final absence = Absence.empty();

      expect(absence.admitterNote, '');
      expect(absence.createdAt.isBefore(DateTime.now()), true);
      expect(absence.crewId, 0);
      expect(absence.startDate.isBefore(DateTime.now()), true);
      expect(absence.endDate.isBefore(DateTime.now()), true);
      expect(absence.id, 0);
      expect(absence.memberNote, '');
      expect(absence.userId, 0);
      expect(absence.type, Type.sickness);
    });
  });
}

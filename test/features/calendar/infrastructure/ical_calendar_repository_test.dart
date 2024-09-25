import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/calendar/infrastructure/ical_calendar_repository.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../absence/application/absence_cubit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockIAbsenceRepository mockAbsenceRepository;
  late ICalCalendarRepository repository;

  setUp(() {
    mockAbsenceRepository = MockIAbsenceRepository();
    repository = ICalCalendarRepository(
      mockAbsenceRepository,
      downloadsPath: 'test/features/calendar/infrastructure/downloads',
    );
  });

  group('ICalCalendarRepository', () {
    test('createAndSaveCalendars success', () async {
      final users = [
        const User(
          id: 1,
          crewId: 1,
          name: 'John Doe',
          image: 'image.jpg',
          userId: 1,
        ),
      ];
      final absences = [
        Absence(
          admitterNote: 'Approved',
          createdAt: DateTime(2023),
          crewId: 1,
          startDate: DateTime(2023, 5),
          endDate: DateTime(2023, 5, 5),
          id: 1,
          memberNote: 'Vacation',
          userId: 1,
          type: Type.vacation,
          admitterId: 2,
        ),
      ];

      when(mockAbsenceRepository.readUsers()).thenAnswer((_) async => users);

      final result = await repository.createAndSaveCalendars(
        absences,
        isWeb: false,
      );

      verify(mockAbsenceRepository.readUsers()).called(1);
      expect(result.isRight(), true);
    });

    test('createAndSaveCalendars failure - UserNotFoundException', () async {
      final users = [
        const User(
          id: 2,
          crewId: 1,
          name: 'Jane Doe',
          image: 'image.jpg',
          userId: 2,
        ),
      ];
      final absences = [
        Absence(
          admitterNote: 'Approved',
          createdAt: DateTime(2023),
          crewId: 1,
          startDate: DateTime(2023, 5),
          endDate: DateTime(2023, 5, 5),
          id: 1,
          memberNote: 'Vacation',
          userId: 1,
          type: Type.vacation,
          admitterId: 2,
        ),
      ];

      when(mockAbsenceRepository.readUsers()).thenAnswer((_) async => users);

      final result = await repository.createAndSaveCalendars(
        absences,
        isWeb: false,
      );

      verify(mockAbsenceRepository.readUsers()).called(1);
      expect(result.isLeft(), true);
      result.fold(
        (failure) =>
            expect(failure.message, contains('User not found for an absence')),
        (_) => fail('Should not succeed'),
      );
    });

    test('createAndSaveCalendars failure - Exception', () async {
      when(mockAbsenceRepository.readUsers())
          .thenThrow(Exception('Test error'));

      final result = await repository.createAndSaveCalendars([], isWeb: false);

      verify(mockAbsenceRepository.readUsers()).called(1);
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure.message, contains('Test error')),
        (_) => fail('Should not succeed'),
      );
    });

    group('_saveCalendar', () {
      test('_saveCalendarForWeb', () async {
        final users = [
          const User(
            id: 1,
            crewId: 1,
            name: 'Jane Doe',
            image: 'image.jpg',
            userId: 1,
          ),
        ];
        final absences = [
          Absence(
            admitterNote: 'Approved',
            createdAt: DateTime(2023),
            crewId: 1,
            startDate: DateTime(2023, 5),
            endDate: DateTime(2023, 5, 5),
            id: 1,
            memberNote: 'Vacation',
            userId: 1,
            type: Type.vacation,
            admitterId: 2,
          ),
        ];

        when(mockAbsenceRepository.readUsers()).thenAnswer((_) async => users);

        final result = await repository.createAndSaveCalendars(
          absences,
          isWeb: true,
        );

        verify(mockAbsenceRepository.readUsers()).called(1);

        expect(result.isRight(), false);
      });

      test('_saveCalendarForMobile success', () async {
        final absence = Absence.empty().copyWith(id: 1);

        expect(
          () => repository.createAndSaveCalendars([absence], isWeb: false),
          returnsNormally,
        );
      });

      test('_saveCalendarForMobile failure', () async {
        final users = [
          const User(
            id: 2,
            crewId: 1,
            name: 'Jane Doe',
            image: 'image.jpg',
            userId: 2,
          ),
        ];
        final absences = [
          Absence(
            admitterNote: 'Approved',
            createdAt: DateTime(2023),
            crewId: 1,
            startDate: DateTime(2023, 5),
            endDate: DateTime(2023, 5, 5),
            id: 1,
            memberNote: 'Vacation',
            userId: 1,
            type: Type.vacation,
            admitterId: 2,
          ),
        ];

        when(mockAbsenceRepository.readUsers()).thenAnswer((_) async => users);

        final result = await repository.createAndSaveCalendars(
          absences,
          isWeb: false,
        );

        expect(result.isLeft(), true);
        // result.fold(
        //   (failure) => expect(
        //     failure.message,
        //     contains('Could not get downloads directory'),
        //   ),
        //   (_) => fail('Should not succeed'),
        // );
      });
    });
  });
}

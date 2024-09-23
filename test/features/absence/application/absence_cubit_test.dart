import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/absence/domain/paginated_absence_response.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'absence_cubit_test.mocks.dart';

@GenerateMocks([IAbsenceRepository])
void main() {
  late MockIAbsenceRepository mockAbsenceRepository;
  late AbsenceCubit absenceCubit;

  setUpAll(() {
    provideDummy<Either<Failure, PaginatedAbsenceResponse>>(
      right(PaginatedAbsenceResponse.empty()),
    );
  });

  setUp(() {
    mockAbsenceRepository = MockIAbsenceRepository();
    absenceCubit = AbsenceCubit(mockAbsenceRepository);
  });

  tearDown(() {
    absenceCubit.close();
  });

  const genericFailure = Failure(code: 101, message: 'Error');
  final genericDate = DateTime(2021);

  PaginatedAbsenceResponse createMockResponse({
    int currentPage = 1,
    int totalPages = 2,
    int absencesCount = 10,
  }) {
    return PaginatedAbsenceResponse(
      absences: List.generate(absencesCount, (_) => Absence.empty()),
      currentPage: currentPage,
      totalPages: totalPages,
      totalAbsences: totalPages * absencesCount,
    );
  }

  test('initial state is AbsenceState.loading', () {
    expect(absenceCubit.state, const AbsenceState.loading());
  });

  group('fetchAbsencesWithMembers', () {
    blocTest<AbsenceCubit, AbsenceState>(
      'emits [loading, loaded] when fetchAbsencesWithMembers is successful',
      build: () {
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(),
        ).thenAnswer((_) async => right(createMockResponse()));
        return absenceCubit;
      },
      act: (cubit) => cubit.fetchAbsencesWithMembers(),
      expect: () => [
        const AbsenceState.loading(),
        isA<AbsenceState>().having(
          (state) => state.maybeMap(
            loaded: (loaded) => loaded.absences.length,
            orElse: () => -1,
          ),
          'absences length',
          10,
        ),
      ],
    );

    blocTest<AbsenceCubit, AbsenceState>(
      'emits [loading, error] when fetchAbsencesWithMembers fails',
      build: () {
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(),
        ).thenAnswer((_) async => left(genericFailure));
        return absenceCubit;
      },
      act: (cubit) => cubit.fetchAbsencesWithMembers(),
      expect: () => [
        const AbsenceState.loading(),
        const AbsenceState.error(genericFailure),
      ],
    );

    blocTest<AbsenceCubit, AbsenceState>(
      'does not emit new state when fetching page out of range',
      build: () => absenceCubit,
      act: (cubit) => cubit.fetchAbsencesWithMembers(page: 0),
      expect: () => <dynamic>[],
    );

    blocTest<AbsenceCubit, AbsenceState>(
      'resets state when reset is true',
      build: () {
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(
            type: 'vacation',
            date: genericDate,
          ),
        ).thenAnswer((_) async => right(createMockResponse()));
        return absenceCubit;
      },
      act: (cubit) => cubit.fetchAbsencesWithMembers(
        reset: true,
        type: 'vacation',
        date: genericDate,
      ),
      expect: () => [
        isA<AbsenceState>().having(
          (state) => state.maybeMap(
            loaded: (loaded) => loaded.absences.length,
            orElse: () => -1,
          ),
          'absences length',
          10,
        ),
      ],
    );
  });

  group('loadMoreAbsences', () {
    blocTest<AbsenceCubit, AbsenceState>(
      'loads more absences when there are more pages',
      build: () {
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(),
        ).thenAnswer((_) async => right(createMockResponse()));
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(
            page: 2,
          ),
        ).thenAnswer((_) async => right(createMockResponse(currentPage: 2)));
        return absenceCubit;
      },
      act: (cubit) async {
        await cubit.fetchAbsencesWithMembers();
        cubit.loadMoreAbsences();
      },
      expect: () => [
        const AbsenceState.loading(),
        isA<AbsenceState>().having(
          (state) => state.maybeMap(
            loaded: (loaded) => loaded.absences.length,
            orElse: () => -1,
          ),
          'absences length',
          10,
        ),
        isA<AbsenceState>().having(
          (state) => state.maybeMap(
            loaded: (loaded) => loaded.absences.length,
            orElse: () => -1,
          ),
          'absences length',
          20,
        ),
      ],
    );
  });

  group('filterAbsences', () {
    blocTest<AbsenceCubit, AbsenceState>(
      'filters absences by type and date',
      build: () {
        when(
          mockAbsenceRepository.fetchAbsencesWithMembers(
            type: 'vacation',
            date: anyNamed('date'),
          ),
        ).thenAnswer((_) async => right(createMockResponse(absencesCount: 5)));
        return absenceCubit;
      },
      act: (cubit) => cubit.filterAbsences(
        type: 'vacation',
        date: genericDate,
      ),
      expect: () => [
        isA<AbsenceState>().having(
          (state) => state.maybeMap(
            loaded: (loaded) => loaded.absences.length,
            orElse: () => -1,
          ),
          'absences length',
          5,
        ),
      ],
    );
  });
}

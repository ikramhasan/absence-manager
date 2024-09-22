import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
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
    // Provide a dummy value for Either<Failure, List<Absence>>
    provideDummy<Either<Failure, List<Absence>>>(right(<Absence>[]));
  });

  setUp(() {
    mockAbsenceRepository = MockIAbsenceRepository();
    absenceCubit = AbsenceCubit(mockAbsenceRepository);
  });

  tearDown(() {
    absenceCubit.close();
  });

  const genericFailure = Failure(code: 101, message: 'Error');

  test('initial state is AbsenceState.loading', () {
    expect(absenceCubit.state, const AbsenceState.loading());
  });

  blocTest<AbsenceCubit, AbsenceState>(
    'emits [loading, loaded] when fetchAbsencesWithMembers is successful',
    build: () {
      when(mockAbsenceRepository.fetchAbsencesWithMembers())
          .thenAnswer((_) async => right(<Absence>[]));
      return absenceCubit;
    },
    act: (cubit) => cubit.fetchAbsencesWithMembers(),
    expect: () => [
      const AbsenceState.loading(),
      const AbsenceState.loaded(<Absence>[]),
    ],
  );

  blocTest<AbsenceCubit, AbsenceState>(
    'emits [loading, error] when fetchAbsencesWithMembers fails',
    build: () {
      when(mockAbsenceRepository.fetchAbsencesWithMembers())
          .thenAnswer((_) async => left(genericFailure));
      return absenceCubit;
    },
    act: (cubit) => cubit.fetchAbsencesWithMembers(),
    expect: () => [
      const AbsenceState.loading(),
      const AbsenceState.error(genericFailure),
    ],
  );
}

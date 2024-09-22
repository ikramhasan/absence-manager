part of 'absence_cubit.dart';

@freezed

/// A class representing the state of the AbsenceCubit.
class AbsenceState with _$AbsenceState {
  /// The initial state of the AbsenceCubit.
  const factory AbsenceState.initial() = _Initial;

  /// The loading state of the AbsenceCubit.
  const factory AbsenceState.loading() = _Loading;

  /// The loaded state of the AbsenceCubit.
  const factory AbsenceState.loaded(List<Absence> absences) = _Loaded;

  /// The error state of the AbsenceCubit.
  const factory AbsenceState.error(Failure failure) = _Error;
}

part of 'absence_cubit.dart';

@freezed

/// A class representing the state of the AbsenceCubit.
class AbsenceState with _$AbsenceState {
  /// The loading state of the AbsenceCubit.
  const factory AbsenceState.loading() = AbsenceLoading;

  /// The loaded state of the AbsenceCubit.
  const factory AbsenceState.loaded(List<Absence> absences) = AbsenceLoaded;

  /// The error state of the AbsenceCubit.
  const factory AbsenceState.error(Failure failure) = AbsenceError;
}

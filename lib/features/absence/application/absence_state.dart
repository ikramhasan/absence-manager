part of 'absence_cubit.dart';

@freezed

/// A class representing the state of the AbsenceCubit.
class AbsenceState with _$AbsenceState {
  /// The loading state of the AbsenceCubit.
  const factory AbsenceState.loading() = AbsenceLoading;

  /// The loaded state of the AbsenceCubit.
  const factory AbsenceState.loaded({
    required List<Absence> absences,
    required int currentPage,
    required int totalPages,
    required int totalAbsences,
    required bool hasMore,
    String? filterType,
    DateTime? filterDate,
  }) = AbsenceLoaded;

  /// The error state of the AbsenceCubit.
  const factory AbsenceState.error(Failure failure) = AbsenceError;
}

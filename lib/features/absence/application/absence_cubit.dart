import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_state.dart';
part 'absence_cubit.freezed.dart';

/// A cubit managing the state of the absence feature.
class AbsenceCubit extends Cubit<AbsenceState> {
  /// Creates an [AbsenceCubit] instance with the given [IAbsenceRepository].
  AbsenceCubit(this._repository) : super(const AbsenceState.loading());

  final IAbsenceRepository _repository;

  /// Fetches absences with members.
  ///
  /// Emits a loading state while fetching.
  /// Emits a loaded state with the absences if successful.
  /// Emits an error state with the failure otherwise.
  Future<void> fetchAbsencesWithMembers() async {
    emit(const AbsenceState.loading());

    final result = await _repository.fetchAbsencesWithMembers();

    result.fold(
      (failure) => emit(AbsenceState.error(failure)),
      (absences) => emit(AbsenceState.loaded(absences)),
    );
  }
}

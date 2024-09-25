import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/calendar/domain/i_calendar_repository.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.dart';
part 'calendar_cubit.freezed.dart';

/// A cubit managing the state of the calendar feature.
class CalendarCubit extends Cubit<CalendarState> {
  /// Creates a [CalendarCubit] instance with the given [ICalendarRepository].
  CalendarCubit(this._repository) : super(const CalendarState.initial());

  final ICalendarRepository _repository;

  /// Creates and saves iCalendar files for the given list of absences.
  ///
  /// Emits a loading state while creating and saving.
  /// Emits a success state if successful.
  /// Emits an error state with the failure otherwise.
  Future<void> createAndSaveCalendars(List<Absence> absences) async {
    emit(const CalendarState.loading());

    final result =
        await _repository.createAndSaveCalendars(absences, isWeb: kIsWeb);

    result.fold(
      (failure) => emit(CalendarState.error(failure)),
      (_) => emit(const CalendarState.success()),
    );
  }
}

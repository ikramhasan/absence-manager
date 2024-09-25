part of 'calendar_cubit.dart';

@freezed

/// A class representing the state of the CalendarCubit.
class CalendarState with _$CalendarState {
  /// The initial state of the calendar feature.
  const factory CalendarState.initial() = CalendarStateInitial;

  /// The loading state while creating and saving calendars.
  const factory CalendarState.loading() = CalendarStateLoading;

  /// The success state after calendars have been created and saved.
  const factory CalendarState.success() = CalendarStateSuccess;

  /// The error state when an error occurs during calendar creation or saving.
  const factory CalendarState.error(Failure failure) = CalendarStateError;
}

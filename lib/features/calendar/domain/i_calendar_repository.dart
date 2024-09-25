// ignore_for_file: one_member_abstracts

import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:fpdart/fpdart.dart';

/// Calendar repository abstract
abstract class ICalendarRepository {
  /// Creates and saves iCalendar files for the given list of users.
  ///
  /// Returns [Unit] if successful, or a [Failure] if an error occurs.
  Future<Either<Failure, Unit>> createAndSaveCalendars(
    List<Absence> absences, {
    required bool isWeb,
  });
}

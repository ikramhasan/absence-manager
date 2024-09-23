// ignore_for_file: one_member_abstracts

import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/paginated_absence_response.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:fpdart/fpdart.dart';

/// An abstract class representing the absence repository.
abstract class IAbsenceRepository {
  /// Fetches a list of absences.
  ///
  /// Returns a [List] of [Absence]s if successful.
  /// Returns a [Failure] otherwise.
  Future<Either<Failure, PaginatedAbsenceResponse>> fetchAbsencesWithMembers({
    int page = 1,
    int limit = 10,
    String? type,
    DateTime? date,
  });

  /// Reads the absences from the local data.
  Future<List<Absence>> readAbsences();

  /// Reads the users from the local data.
  Future<List<User>> readUsers();
}

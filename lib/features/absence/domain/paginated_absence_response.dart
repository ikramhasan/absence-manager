import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_absence_response.freezed.dart';
part 'paginated_absence_response.g.dart';

@freezed

/// A class representing a paginated response of absences.
class PaginatedAbsenceResponse with _$PaginatedAbsenceResponse {
  /// A paginated response of absences.
  ///
  /// [absences] is a list of absences.
  /// [currentPage] is the current page.
  /// [totalPages] is the total number of pages.
  /// [totalAbsences] is the total number of absences.
  const factory PaginatedAbsenceResponse({
    required List<Absence> absences,
    required int currentPage,
    required int totalPages,
    required int totalAbsences,
  }) = _PaginatedAbsenceResponse;

  /// Creates a [PaginatedAbsenceResponse] from a JSON object.
  factory PaginatedAbsenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAbsenceResponseFromJson(json);

  /// Creates an empty [PaginatedAbsenceResponse].
  factory PaginatedAbsenceResponse.empty() => const _PaginatedAbsenceResponse(
        absences: [],
        currentPage: 0,
        totalPages: 0,
        totalAbsences: 0,
      );
}

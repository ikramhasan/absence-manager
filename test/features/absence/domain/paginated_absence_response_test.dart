import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/paginated_absence_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaginatedAbsenceResponse', () {
    test(
        'should create a PaginatedAbsenceResponse '
        'instance using the factory constructor', () {
      final absences = [
        Absence.empty(),
        Absence.empty(),
      ];

      final response = PaginatedAbsenceResponse(
        absences: absences,
        currentPage: 1,
        totalPages: 5,
        totalAbsences: 10,
      );

      expect(response.absences, absences);
      expect(response.currentPage, 1);
      expect(response.totalPages, 5);
      expect(response.totalAbsences, 10);
    });

    test('should create a PaginatedAbsenceResponse instance from JSON', () {
      final jsonMap = {
        'absences': [
          Absence.empty().toJson(),
          Absence.empty().toJson(),
        ],
        'currentPage': 2,
        'totalPages': 3,
        'totalAbsences': 15,
      };

      final response = PaginatedAbsenceResponse.fromJson(jsonMap);

      expect(response.absences.length, 2);
      expect(response.absences[0], isA<Absence>());
      expect(response.currentPage, 2);
      expect(response.totalPages, 3);
      expect(response.totalAbsences, 15);
    });

    test('should create an empty PaginatedAbsenceResponse instance', () {
      final response = PaginatedAbsenceResponse.empty();

      expect(response.absences, isEmpty);
      expect(response.currentPage, 0);
      expect(response.totalPages, 0);
      expect(response.totalAbsences, 0);
    });

    test('should convert PaginatedAbsenceResponse to JSON', () {
      final absences = [
        Absence.empty(),
        Absence.empty(),
      ];

      final response = PaginatedAbsenceResponse(
        absences: absences,
        currentPage: 1,
        totalPages: 5,
        totalAbsences: 10,
      );

      final json = response.toJson();

      expect(json['absences'], isA<List<dynamic>>());
      // ignore: avoid_dynamic_calls
      expect(json['absences'].length, 2);
      expect(json['currentPage'], 1);
      expect(json['totalPages'], 5);
      expect(json['totalAbsences'], 10);
    });
  });
}

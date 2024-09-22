import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('every member has key', () {
    for (final key in ['id', 'name', 'userId', 'image']) {
      test(key, () async {
        final memberData = json.decode(localDataFixture('members.json'))
            as Map<String, dynamic>;
        for (final member in memberData['payload'] as List<dynamic>) {
          if (member is Map<String, dynamic>) {
            expect(member.containsKey(key), isTrue);
          } else {
            fail('Member is not a Map<String, dynamic>');
          }
        }
      });
    }
  });

  group('every absence has key', () {
    for (final key in [
      'admitterNote',
      'confirmedAt',
      'createdAt',
      'crewId',
      'endDate',
      'id',
      'memberNote',
      'rejectedAt',
      'startDate',
      'type',
      'userId',
    ]) {
      test(key, () async {
        final absenceData = json.decode(localDataFixture('absences.json'))
            as Map<String, dynamic>;
        for (final absence in absenceData['payload'] as List<dynamic>) {
          if (absence is Map<String, dynamic>) {
            expect(absence.containsKey(key), isTrue);
          } else {
            fail('Absence is not a Map<String, dynamic>');
          }
        }
      });
    }
  });
}

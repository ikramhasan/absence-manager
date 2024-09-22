import 'dart:convert';

import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/core/domain/api_response.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('ApiResponse', () {
    group('User', () {
      final jsonMap = json.decode(fixture('user.json')) as Map<String, dynamic>;
      final user = User.fromJson(jsonMap);

      test('fromJson creates an ApiResponse<User> from JSON', () {
        final json = {
          'message': 'Success',
          'payload': [user.toJson()],
        };

        final response = ApiResponse<User>.fromJson(
          json,
          (json) => User.fromJson(json! as Map<String, dynamic>),
        );

        expect(response.message, 'Success');
        expect(response.payload, [user]);
      });

      test('empty creates an empty ApiResponse<User>', () {
        final response = ApiResponse<User>.empty();

        expect(response.message, '');
        expect(response.payload, <User>[]);
      });
    });

    group('Absence', () {
      final jsonMap =
          json.decode(fixture('absence.json')) as Map<String, dynamic>;
      final absence = Absence.fromJson(jsonMap);

      test('fromJson creates an ApiResponse<Absence> from JSON', () {
        final json = {
          'message': 'Success',
          'payload': [absence.toJson()],
        };

        final response = ApiResponse<Absence>.fromJson(
          json,
          (json) => Absence.fromJson(json! as Map<String, dynamic>),
        );

        expect(response.message, 'Success');
        expect(response.payload, [absence]);
      });

      test('empty creates an empty ApiResponse<Absence>', () {
        final response = ApiResponse<Absence>.empty();

        expect(response.message, '');
        expect(response.payload, <Absence>[]);
      });
    });
  });
}

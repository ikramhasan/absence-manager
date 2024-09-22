import 'dart:convert';

import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('fromJson', () {
    test('should return a valid model', () {
      final jsonMap = json.decode(fixture('user.json')) as Map<String, dynamic>;
      final user = User.fromJson(jsonMap);
      expect(user, isA<User>());
    });
  });

  group('empty', () {
    test('should return an empty model', () {
      final user = User.empty();
      expect(user, isA<User>());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      const user = User(
        id: 1,
        crewId: 1,
        name: 'John Doe',
        image: 'https://example.com/image.jpg',
        userId: 1,
      );
      final jsonMap = user.toJson();
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['id'], 1);
      expect(jsonMap['crewId'], 1);
      expect(jsonMap['name'], 'John Doe');
      expect(jsonMap['image'], 'https://example.com/image.jpg');
      expect(jsonMap['userId'], 1);
    });
  });
}

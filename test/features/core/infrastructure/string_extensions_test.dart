import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringCapitalizationExtension', () {
    test('capitalize should capitalize the first letter of a string', () {
      const str = 'hello';
      expect(str.capitalize(), 'Hello');
    });

    test('capitalize should return an empty string if the string is empty', () {
      const str = '';
      expect(str.capitalize(), '');
    });

    test('capitalize should handle single character strings', () {
      const str = 'h';
      expect(str.capitalize(), 'H');
    });

    test(
        'capitalize should handle strings '
        'with the first letter already capitalized', () {
      const str = 'Hello';
      expect(str.capitalize(), 'Hello');
    });
  });

  group('NullableStringExtension', () {
    test('isNullOrEmpty should return true if the string is null', () {
      const String? str = null;
      expect(str.isNullOrEmpty, true);
    });

    test('isNullOrEmpty should return true if the string is empty', () {
      const str = '';
      expect(str.isNullOrEmpty, true);
    });

    test('isNullOrEmpty should return false if the string is not empty', () {
      const str = 'hello';
      expect(str.isNullOrEmpty, false);
    });
  });
}

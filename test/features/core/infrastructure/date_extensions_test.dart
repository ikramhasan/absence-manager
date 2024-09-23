import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateFormatExtensions', () {
    test('toFormattedString should format date correctly', () {
      final date = DateTime(2023);
      final formattedString = date.toFormattedString();
      expect(formattedString, '1 Jan 2023');
    });
  });

  group('DateTimeComparisonExtension', () {
    test('isAfterOrEqual should return true if date is after the given date',
        () {
      final date = DateTime(2023, 1, 2);
      final other = DateTime(2023);
      expect(date.isAfterOrEqual(other), true);
    });

    test('isAfterOrEqual should return true if date is equal to the given date',
        () {
      final date = DateTime(2023);
      final other = DateTime(2023);
      expect(date.isAfterOrEqual(other), true);
    });

    test('isAfterOrEqual should return false if date is before the given date',
        () {
      final date = DateTime(2023);
      final other = DateTime(2023, 1, 2);
      expect(date.isAfterOrEqual(other), false);
    });

    test('isBeforeOrEqual should return true if date is before the given date',
        () {
      final date = DateTime(2023);
      final other = DateTime(2023, 1, 2);
      expect(date.isBeforeOrEqual(other), true);
    });

    test(
        'isBeforeOrEqual should return true if date is equal to the given date',
        () {
      final date = DateTime(2023);
      final other = DateTime(2023);
      expect(date.isBeforeOrEqual(other), true);
    });

    test('isBeforeOrEqual should return false if date is after the given date',
        () {
      final date = DateTime(2023, 1, 2);
      final other = DateTime(2023);
      expect(date.isBeforeOrEqual(other), false);
    });

    test(
        'isBetween should return true if date is '
        'between the given dates inclusively', () {
      final date = DateTime(2023, 1, 2);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetween(from: from, to: to), true);
    });

    test('isBetween should return true if date is equal to the from date', () {
      final date = DateTime(2023);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetween(from: from, to: to), true);
    });

    test('isBetween should return true if date is equal to the to date', () {
      final date = DateTime(2023, 1, 3);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetween(from: from, to: to), true);
    });

    test('isBetween should return false if date is outside the given dates',
        () {
      final date = DateTime(2023, 1, 4);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetween(from: from, to: to), false);
    });

    test(
        'isBetweenExclusive should return true '
        'if date is between the given dates exclusively', () {
      final date = DateTime(2023, 1, 2);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetweenExclusive(from: from, to: to), true);
    });

    test(
        'isBetweenExclusive should return false '
        'if date is equal to the from date', () {
      final date = DateTime(2023);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetweenExclusive(from: from, to: to), false);
    });

    test(
        'isBetweenExclusive should return false '
        'if date is equal to the to date', () {
      final date = DateTime(2023, 1, 3);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetweenExclusive(from: from, to: to), false);
    });

    test(
        'isBetweenExclusive should return false '
        'if date is outside the given dates', () {
      final date = DateTime(2023, 1, 4);
      final from = DateTime(2023);
      final to = DateTime(2023, 1, 3);
      expect(date.isBetweenExclusive(from: from, to: to), false);
    });
  });
}

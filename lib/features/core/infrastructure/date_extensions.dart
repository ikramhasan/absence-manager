import 'package:intl/intl.dart';

/// A set of extensions on [DateTime] to format the date.
extension DateFormatExtensions on DateTime {
  /// Formats the date to a string.
  String toFormattedString() {
    return DateFormat('d MMM yyyy').format(this);
  }
}


/// A set of extensions on [DateTime] to check compare dates
extension DateTimeComparisonExtension on DateTime {
  /// Checks if date is after or equal to given [DateTime]
  bool isAfterOrEqual(DateTime other) {
    return isAtSameMomentAs(other) || isAfter(other);
  }

  /// Checks if date is before or equal to [DateTime]
  bool isBeforeOrEqual(DateTime other) {
    return isAtSameMomentAs(other) || isBefore(other);
  }

  /// Check if date is between two given [DateTime]s
  /// This comparison is inclusive
  bool isBetween({required DateTime from, required DateTime to}) {
    return isAfterOrEqual(from) && isBeforeOrEqual(to);
  }

  /// Check if date is between two given [DateTime]s
  /// This comparison is exclusive
  bool isBetweenExclusive({required DateTime from, required DateTime to}) {
    return isAfter(from) && isBefore(to);
  }
}

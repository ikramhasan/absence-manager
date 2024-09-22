import 'package:intl/intl.dart';

/// A set of extensions on [DateTime] to format the date.
extension DateFormatExtensions on DateTime {
  /// Formats the date to a string.
  String toFormattedString() {
    return DateFormat('d MMM yyyy').format(this);
  }
}

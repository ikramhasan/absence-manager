import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:flutter/material.dart';

/// A widget that displays the date range of an absence.
class DateRangeRowWidget extends StatelessWidget {
  /// Creates a [DateRangeRowWidget].
  const DateRangeRowWidget({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  /// The start date of the absence.
  final DateTime startDate;

  /// The end date of the absence.
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final startDay = startDate.day.toString();
    final endDay = endDate.day.toString();

    final monthYear =
        '${startDate.toFormattedString().split(' ')[1]} ${startDate.year}';

    final dateRangeText = startDay == endDay
        ? '$startDay $monthYear'
        : '$startDay - $endDay $monthYear';

    return Text(
      dateRangeText,
      style: const TextStyle(
        letterSpacing: -0.5,
        fontSize: 16,
      ),
    );
  }
}

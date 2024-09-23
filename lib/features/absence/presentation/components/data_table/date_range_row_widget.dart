import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:absence_manager/features/core/presentation/components/widget_size.dart';
import 'package:flutter/material.dart';

/// A widget that displays the date range of an absence.
class DateRangeRowWidget extends StatelessWidget {
  /// Creates a [DateRangeRowWidget].
  const DateRangeRowWidget({
    required this.startDate,
    required this.endDate,
    this.size = WidgetSize.large,
    super.key,
  });

  /// The start date of the absence.
  final DateTime startDate;

  /// The end date of the absence.
  final DateTime endDate;

  /// The size of the widget.
  final WidgetSize size;

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
      style: TextStyle(
        letterSpacing: -0.5,
        fontSize: size == WidgetSize.small ? 14 : 16,
      ),
    );
  }
}

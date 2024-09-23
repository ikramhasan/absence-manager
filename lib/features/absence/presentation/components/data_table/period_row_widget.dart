import 'package:flutter/material.dart';

/// A widget that displays the period of an absence.
class PeriodRowWidget extends StatelessWidget {
  /// Creates a [PeriodRowWidget].
  ///
  /// The [startDate] and [endDate] parameters must not be null.
  const PeriodRowWidget({
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
    final differenceInDays = endDate.difference(startDate).inDays;

    return Text(
      '${differenceInDays == 0 ? 1 : differenceInDays}'
      ' day${differenceInDays > 1 ? 's' : ''}',
      style: const TextStyle(
        letterSpacing: -0.5,
        fontSize: 16,
      ),
    );
  }
}

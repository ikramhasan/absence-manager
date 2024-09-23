import 'package:flutter/material.dart';

/// A widget that displays the status of an absence request.
class AbsenceStatusWidget extends StatelessWidget {
  /// Creates an [AbsenceStatusWidget].
  const AbsenceStatusWidget({super.key, this.confirmedAt, this.rejectedAt});

  /// The date and time when the absence request was confirmed.
  final DateTime? confirmedAt;

  /// The date and time when the absence request was rejected.
  final DateTime? rejectedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: rejectedAt != null
            ? const Color(0xFFFFE5E5)
            : confirmedAt != null
                ? const Color(0xFFECFCE5)
                : const Color(0xFFFFEFD7),
      ),
      child: Text(
        rejectedAt != null
            ? 'Rejected'
            : confirmedAt != null
                ? 'Confirmed'
                : 'Requested',
        style: TextStyle(
          color: rejectedAt != null
              ? const Color(0xFFD3180C)
              : confirmedAt != null
                  ? const Color(0xFF198155)
                  : const Color(0xFFA05E03),
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

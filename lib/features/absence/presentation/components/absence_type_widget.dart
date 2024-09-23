import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:flutter/material.dart';

/// A widget that displays the type of an absence.
class AbsenceTypeWidget extends StatelessWidget {
  /// Creates an [AbsenceTypeWidget].
  ///
  /// The [type] parameter must not be null.
  /// Type can be of two values: 'vacation' or 'sickness'.
  const AbsenceTypeWidget({required this.type, super.key});

  /// The type of the absence.
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFFDFF5FF),
      ),
      child: Text(
        type.capitalize(),
        style: const TextStyle(
          color: Color(0xFF0065D0),
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

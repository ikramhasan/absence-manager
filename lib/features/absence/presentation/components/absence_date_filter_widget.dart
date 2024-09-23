import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/core/infrastructure/app_haptic_feedback.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a filter for absences.
class AbsenceDateFilterWidget extends StatelessWidget {
  /// Creates an [AbsenceDateFilterWidget].
  const AbsenceDateFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        AppHapticFeedback(context).provide();

        final selectedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2021),
          lastDate: DateTime(2021, 12, 31),
        );

        if (selectedDate != null) {
          // ignore: use_build_context_synchronously
          context.read<AbsenceCubit>().filterAbsences(date: selectedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month_rounded),
            const SizedBox(width: 8),
            Text(context.l10n.date),
          ],
        ),
      ),
    );
  }
}

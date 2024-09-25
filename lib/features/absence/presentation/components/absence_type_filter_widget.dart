import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/core/infrastructure/app_haptic_feedback.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a filter for absences.
class AbsenceTypeFilterWidget extends StatelessWidget {
  /// Creates an [AbsenceTypeFilterWidget].
  const AbsenceTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<AbsenceCubit>().state.whenOrNull(
          loaded: (
            _,
            __,
            ___,
            ____,
            _____,
            filterType,
            ______,
          ) =>
              filterType,
        );

    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.filter_alt_outlined),
            const SizedBox(width: 8),
            if (selectedType != null)
              Text(selectedType.capitalize())
            else
              Text(context.l10n.type),
          ],
        ),
      ),
      onSelected: (value) {
        AppHapticFeedback(context).provide();
        
        if (value != 'all') {
          context.read<AbsenceCubit>().filterAbsences(type: value);
        } else {
          context.read<AbsenceCubit>().fetchAbsencesWithMembers(reset: true);
        }
      },
      itemBuilder: (_) {
        return [
          const PopupMenuItem<String>(
            value: 'all',
            child: Text('All'),
          ),
          const PopupMenuItem<String>(
            value: 'sickness',
            child: Text('Sickness'),
          ),
          const PopupMenuItem<String>(
            value: 'vacation',
            child: Text('Vacation'),
          ),
        ];
      },
    );
  }
}

import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a filter for absences.
class AbsenceTypeFilterWidget extends StatelessWidget {
  /// Creates an [AbsenceTypeFilterWidget].
  const AbsenceTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.filter_list),
            SizedBox(width: 8),
            Text('Type'),
          ],
        ),
      ),
      onSelected: (value) {
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

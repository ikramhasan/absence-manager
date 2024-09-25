import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/core/infrastructure/app_haptic_feedback.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/core/presentation/components/widget_size.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a filter for absences.
class AbsenceTypeFilterWidget extends StatelessWidget {
  /// Creates an [AbsenceTypeFilterWidget].
  const AbsenceTypeFilterWidget({super.key, this.size = WidgetSize.large});

  /// The size of the widget. Defaults to [WidgetSize.large].
  final WidgetSize size;

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
        padding: size == WidgetSize.small
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_alt_outlined,
              size: size == WidgetSize.small ? 18 : 24,
            ),
            if (size == WidgetSize.small)
              const SizedBox(width: 6)
            else
              const SizedBox(width: 8),
            if (selectedType != null)
              Text(
                selectedType.capitalize(),
                style: TextStyle(
                  fontSize: size == WidgetSize.small ? 14 : 16,
                ),
              )
            else
              Text(
                context.l10n.type,
                style: TextStyle(
                  fontSize: size == WidgetSize.small ? 14 : 16,
                ),
              ),
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

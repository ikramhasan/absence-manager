import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/core/infrastructure/app_haptic_feedback.dart';
import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:absence_manager/features/core/presentation/components/widget_size.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a filter for absences.
class AbsenceDateFilterWidget extends StatelessWidget {
  /// Creates an [AbsenceDateFilterWidget].
  const AbsenceDateFilterWidget({super.key, this.size = WidgetSize.large});

  /// The size of the widget. Defaults to [WidgetSize.large].
  final WidgetSize size;

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.watch<AbsenceCubit>().state.whenOrNull(
          loaded: (
            _,
            __,
            ___,
            ____,
            _____,
            ______,
            filterDate,
          ) =>
              filterDate,
        );

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
              Icons.calendar_month_rounded,
              size: size == WidgetSize.small ? 18 : 24,
            ),
            if (size == WidgetSize.small)
              const SizedBox(width: 6)
            else
              const SizedBox(width: 8),
            if (selectedDate != null)
              Text(
                selectedDate.toFormattedString(),
                style: TextStyle(fontSize: size == WidgetSize.small ? 14 : 16),
              )
            else
              Text(
                context.l10n.date,
                style: TextStyle(fontSize: size == WidgetSize.small ? 14 : 16),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:absence_manager/features/core/presentation/components/widget_size.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays the status of an absence request.
class AbsenceStatusWidget extends StatelessWidget {
  /// Creates an [AbsenceStatusWidget].
  const AbsenceStatusWidget({
    super.key,
    this.confirmedAt,
    this.rejectedAt,
    this.size = WidgetSize.large,
  });

  /// The date and time when the absence request was confirmed.
  final DateTime? confirmedAt;

  /// The date and time when the absence request was rejected.
  final DateTime? rejectedAt;

  /// The size of the widget. Defaults to [WidgetSize.large].
  final WidgetSize size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final rejectedContainerColor = state.settings.isDarkTheme
            ? const Color(0xFF780101).withOpacity(0.54)
            : const Color(0xFFFFE5E5);

        final confirmedContainerColor = state.settings.isDarkTheme
            ? const Color(0xFF0B654A).withOpacity(0.38)
            : const Color(0xFFECFCE5);

        final requestedContainerColor = state.settings.isDarkTheme
            ? const Color(0xFF5F552B).withOpacity(0.67)
            : const Color(0xFFFFEFD7);

        final rejectedTextColor = state.settings.isDarkTheme
            ? const Color(0xFFFF0000)
            : const Color(0xFFD3180C);

        final confirmedTextColor = state.settings.isDarkTheme
            ? const Color(0xFF55FFE1)
            : const Color(0xFF198155);

        final requestedTextColor = state.settings.isDarkTheme
            ? const Color(0xFFFFE661)
            : const Color(0xFFA05E03);

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: rejectedAt != null
                ? rejectedContainerColor
                : confirmedAt != null
                    ? confirmedContainerColor
                    : requestedContainerColor,
          ),
          child: Text(
            rejectedAt != null
                ? 'Rejected'
                : confirmedAt != null
                    ? 'Confirmed'
                    : 'Requested',
            style: TextStyle(
              color: rejectedAt != null
                  ? rejectedTextColor
                  : confirmedAt != null
                      ? confirmedTextColor
                      : requestedTextColor,
              fontWeight: FontWeight.w400,
              fontSize: size == WidgetSize.small ? 14 : 16,
            ),
          ),
        );
      },
    );
  }
}

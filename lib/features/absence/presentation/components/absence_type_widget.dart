import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: state.settings.isDarkTheme
                ? const Color(0xFF5A5A5A).withOpacity(0.67)
                : const Color(0xFFDFF5FF),
          ),
          child: Text(
            type.capitalize(),
            style: TextStyle(
              color: state.settings.isDarkTheme
                  ? const Color(0xFFF5F5F5)
                  : const Color(0xFF0065D0),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}

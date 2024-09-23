import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_section.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Haptic Feedback Selection Page view
class HapticFeedbackSelectionPage extends StatelessWidget {
  /// Creates a [HapticFeedbackSelectionPage].
  const HapticFeedbackSelectionPage({super.key});

  /// The route name of the haptic feedback selection page.
  static String route = 'haptic';

  @override
  Widget build(BuildContext context) {
    final impacts = [
      'light',
      'medium',
      'heavy',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.hapticFeedback),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              buildWhen: (previous, current) =>
                  previous.settings.hapticFeedbackImpact !=
                  current.settings.hapticFeedbackImpact,
              builder: (context, state) {
                return SettingsWidget(
                  sections: [
                    SettingsSection(
                      title: Text(context.l10n.selectHapticFeedbackStrength),
                      tiles: [
                        ...impacts.map(
                          (impact) => SettingsTile(
                            title: Text(impact.capitalize()),
                            onTap: () {
                              context
                                  .read<SettingsCubit>()
                                  .updateHapticFeedbackImpact(impact);
                              switch (impact) {
                                case 'light':
                                  HapticFeedback.lightImpact();
                                case 'medium':
                                  HapticFeedback.mediumImpact();
                                case 'heavy':
                                  HapticFeedback.heavyImpact();
                              }
                            },
                            trailing:
                                state.settings.hapticFeedbackImpact == impact
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

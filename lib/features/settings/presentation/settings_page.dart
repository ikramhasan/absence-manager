import 'package:absence_manager/features/core/infrastructure/app_url_launcher.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_section.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_widget.dart';
import 'package:absence_manager/features/settings/presentation/haptic_feedback_selection_page.dart';
import 'package:absence_manager/features/settings/presentation/language_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Setting Page view
class SettingsPage extends StatelessWidget {
  /// Creates a [SettingsPage].
  const SettingsPage({super.key});

  /// The route name of the settings page.
  static String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return SettingsWidget(
                  sections: [
                    SettingsSection(
                      title: Text(context.l10n.preferences),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          initialValue: context
                              .watch<SettingsCubit>()
                              .state
                              .settings
                              .isDarkTheme,
                          title: Text(context.l10n.darkMode),
                          semanticLabel: context.l10n.darkMode,
                          onToggle: (value) {
                            context.read<SettingsCubit>().changeTheme();
                          },
                        ),
                        SettingsTile.navigation(
                          title: Text(context.l10n.languageSelection),
                          trailing: Text(context.l10n.language),
                          semanticLabel: context.l10n.languageSelection,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<LanguageSelectionPage>(
                                builder: (context) {
                                  return const LanguageSelectionPage();
                                },
                              ),
                            );
                          },
                        ),
                        SettingsTile.navigation(
                          title: Text(context.l10n.hapticFeedback),
                          semanticLabel: context.l10n.hapticFeedback,
                          trailing: Text(
                            state.settings.hapticFeedbackImpact.capitalize(),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<HapticFeedbackSelectionPage>(
                                builder: (context) {
                                  return const HapticFeedbackSelectionPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Text(context.l10n.about),
                      tiles: [
                        SettingsTile.navigation(
                          title: Text(context.l10n.viewCode),
                          semanticLabel: context.l10n.viewCode,
                          onTap: () async {
                            await AppUrlLauncher.launch(
                              'https://github.com/ikramhasan/absence-manager',
                            );
                          },
                        ),
                        SettingsTile.navigation(
                          title: Text(context.l10n.developer),
                          semanticLabel: context.l10n.developer,
                          onTap: () async {
                            await AppUrlLauncher.launch(
                              'https://github.com/ikramhasan',
                            );
                          },
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

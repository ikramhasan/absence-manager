import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_section.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Language selection page.
class LanguageSelectionPage extends StatelessWidget {
  /// Creates a [LanguageSelectionPage].
  const LanguageSelectionPage({super.key});

  /// The route name of the language selection page.
  static String route = 'language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.languageSelection),
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
                  previous.settings.languageCode !=
                  current.settings.languageCode,
              builder: (context, state) {
                return SettingsWidget(
                  sections: [
                    SettingsSection(
                      title: Text(context.l10n.selectALanguage),
                      tiles: [
                        ...supportedLanguages.map(
                          (lang) => SettingsTile(
                            title: Text(lang.languageName),
                            onTap: () {
                              context
                                  .read<SettingsCubit>()
                                  .changeLanguage(lang.locale);
                            },
                            trailing: state.settings.languageCode ==
                                    lang.locale.languageCode
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

import 'package:absence_manager/features/settings/presentation/components/settings_section.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_section_widget.dart';
import 'package:flutter/widgets.dart';

/// A widget that represents a list of settings sections.
class SettingsWidget extends StatelessWidget {
  /// Creates a [SettingsWidget].
  const SettingsWidget({required this.sections, super.key});

  /// The list of settings sections.
  final List<SettingsSection> sections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SettingsSectionWidget(
            tiles: section.tiles,
            title: section.title,
            description: section.description,
          ),
        );
      },
    );
  }
}

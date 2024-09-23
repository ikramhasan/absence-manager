import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:flutter/material.dart';

/// The definition of a section of settings.
class SettingsSection {
  /// Creates a [SettingsSection].
  const SettingsSection({
    required this.tiles,
    this.title,
    this.description,
  });

  /// The title of the section.
  final Widget? title;

  /// The list of settings tiles.
  final List<SettingsTile> tiles;

  /// The description of the section.
  final Widget? description;
}

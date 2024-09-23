// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';

/// The type of a settings tile.
enum SettingsTileType {
  /// A simple tile.
  simpleTile,

  /// A switch tile.
  switchTile,

  /// A navigation tile.
  navigationTile
}

/// A tile in the settings page.
class SettingsTile {
  /// Creates a [SettingsTile].
  SettingsTile({
    required this.title,
    this.leading,
    this.trailing,
    this.value,
    this.description,
    this.onTap,
    this.enabled = true,
    this.semanticLabel,
  }) {
    onToggle = null;
    initialValue = null;
    activeSwitchColor = null;
    tileType = SettingsTileType.simpleTile;
  }

  /// Creates a [SettingsTile] with a navigation tile type.
  SettingsTile.navigation({
    required this.title,
    this.leading,
    this.trailing,
    this.value,
    this.description,
    this.onTap,
    this.enabled = true,
    this.semanticLabel,
  }) {
    onToggle = null;
    initialValue = null;
    activeSwitchColor = null;
    tileType = SettingsTileType.navigationTile;
  }

  /// Creates a [SettingsTile] with a switch tile type.
  SettingsTile.switchTile({
    required this.initialValue,
    required this.onToggle,
    required this.title,
    this.activeSwitchColor,
    this.leading,
    this.trailing,
    this.description,
    this.onTap,
    this.enabled = true,
    this.semanticLabel,
  }) {
    value = null;
    tileType = SettingsTileType.switchTile;
  }

  /// The widget at the beginning of the tile
  final Widget? leading;

  /// The Widget at the end of the tile
  final Widget? trailing;

  /// The widget at the center of the tile
  final Widget title;

  /// The widget at the bottom of the [title]
  final Widget? description;

  /// The semantic label of the tile
  /// 
  /// This is used to make the tile accessible
  final String? semanticLabel;

  /// A function that is called by tap on a tile
  final void Function()? onTap;

  /// The color of the switch when it is active
  late final Color? activeSwitchColor;

  /// The widget that represents the value of the tile
  late final Widget? value;

  /// A function that is called when the switch is toggled
  late final void Function(bool value)? onToggle;

  /// The type of the tile
  late final SettingsTileType tileType;

  /// The initial value of the switch
  late final bool? initialValue;

  /// Whether the tile is enabled
  late final bool enabled;
}

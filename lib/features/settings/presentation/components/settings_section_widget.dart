import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that represents a section of settings.
class SettingsSectionWidget extends StatelessWidget {
  /// Creates a [SettingsSectionWidget].
  const SettingsSectionWidget({
    required this.tiles,
    this.title,
    this.description,
    super.key,
  });

  /// The list of settings tiles.
  final List<SettingsTile> tiles;

  /// The title of the section.
  final Widget? title;

  /// The description of the section.
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.settings.isDarkTheme != current.settings.isDarkTheme,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    bottom: 8,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 14,
                      color: state.settings.isDarkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                    child: title!,
                  ),
                )
              else
                const SizedBox.shrink(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tiles.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final tile = tiles[index];

                  var enableTop = false;

                  if (index == 0 ||
                      (index > 0 && tiles[index - 1].description != null)) {
                    enableTop = true;
                  }

                  var enableBottom = false;

                  if (index == tiles.length - 1 ||
                      (index < tiles.length && tile.description != null)) {
                    enableBottom = true;
                  }

                  return Semantics(
                    label: tile.semanticLabel,
                    child: SettingsTileWidget(
                      tile: tile,
                      needToShowDivider: index != tiles.length - 1,
                      enableTopBorderRadius: enableTop,
                      enableBottomBorderRadius: enableBottom,
                    ),
                  );
                },
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: state.settings.isDarkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                    child: description!,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

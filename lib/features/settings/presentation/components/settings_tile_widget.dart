import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/presentation/components/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a settings tile.
class SettingsTileWidget extends StatelessWidget {
  /// Creates a [SettingsTileWidget].
  const SettingsTileWidget({
    required this.tile,
    required this.needToShowDivider,
    required this.enableTopBorderRadius,
    required this.enableBottomBorderRadius,
    super.key,
  });

  /// The settings tile definition
  final SettingsTile tile;
  /// Whether to show the divider or not
  final bool needToShowDivider;
  /// Whether to enable the top border radius or not
  final bool enableTopBorderRadius;
  /// Whether to enable the bottom border radius or not
  final bool enableBottomBorderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top:
                enableTopBorderRadius ? const Radius.circular(12) : Radius.zero,
            bottom: enableBottomBorderRadius
                ? const Radius.circular(12)
                : Radius.zero,
          ),
          child: Material(
            color: state.settings.isDarkTheme ? Colors.black : Colors.white,
            child: InkWell(
              onTap: tile.onTap,
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsetsDirectional.only(start: 18),
                child: Row(
                  children: [
                    if (tile.leading != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12),
                        child: IconTheme.merge(
                          data: const IconThemeData(),
                          child: tile.leading!,
                        ),
                      ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      top: 12.5,
                                      bottom: 12.5,
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: state.settings.isDarkTheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      child: tile.title,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (tile.trailing != null) tile.trailing!,
                                    if (tile.tileType ==
                                        SettingsTileType.switchTile)
                                      Switch(
                                        value: tile.initialValue ?? true,
                                        onChanged: tile.onToggle,
                                      ),
                                    if (tile.tileType ==
                                            SettingsTileType.navigationTile &&
                                        tile.value != null)
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: state.settings.isDarkTheme
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        child: tile.value!,
                                      ),
                                    if (tile.tileType ==
                                        SettingsTileType.navigationTile)
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          start: 6,
                                          end: 2,
                                        ),
                                        child: IconTheme(
                                          data:
                                              IconTheme.of(context).copyWith(),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18,
                                            color: state.settings.isDarkTheme
                                                ? Colors.grey[400]
                                                : Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (tile.description == null && needToShowDivider)
                            Divider(
                              height: 0,
                              thickness: 0.7,
                              color: state.settings.isDarkTheme
                                  ? const Color(0xFF303030)
                                  : null,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

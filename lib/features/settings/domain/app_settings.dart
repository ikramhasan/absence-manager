import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed

/// A class that represents the settings of the application.
class AppSettings with _$AppSettings {
  /// Creates an [AppSettings].
  ///
  /// [isDarkTheme] indicates whether the dark theme is enabled.
  /// [languageCode] is the code of the language.
  /// [hapticFeedbackImpact] is the impact of the haptic feedback.
  const factory AppSettings({
    required bool isDarkTheme,
    required String languageCode,
    required String hapticFeedbackImpact,
  }) = _AppSettings;

  /// Creates an [AppSettings] from JSON data.
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// Creates a default [AppSettings] in case there is no saved settings.
  factory AppSettings.getDefault() => const _AppSettings(
        isDarkTheme: false,
        languageCode: 'en',
        hapticFeedbackImpact: 'medium',
      );
}

part of 'settings_cubit.dart';

@freezed

/// The state of the settings cubit.
class SettingsState with _$SettingsState {
  /// Creates a [SettingsState].
  const factory SettingsState({
    required AppSettings settings,
  }) = _SettingsState;

  /// The initial state of the settings cubit.
  factory SettingsState.initial() => _SettingsState(
        settings: AppSettings.getDefault(),
      );
}

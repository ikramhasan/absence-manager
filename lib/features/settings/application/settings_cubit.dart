import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:absence_manager/features/settings/domain/i_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

/// A cubit that manages the settings of the application.
class SettingsCubit extends Cubit<SettingsState> {
  /// Creates a [SettingsCubit].
  SettingsCubit(this._repo) : super(SettingsState.initial());

  final ISettingsRepository _repo;

  /// Change the theme of the application
  Future<void> changeTheme() async {
    final existingSettings = state.settings;
    final newSettings =
        existingSettings.copyWith(isDarkTheme: !existingSettings.isDarkTheme);
    await _repo.saveSettings(newSettings);
    await loadSettings();
  }

  /// Change the language of the application
  Future<void> changeLanguage(Locale locale) async {
    final existingSettings = state.settings;
    final newSettings =
        existingSettings.copyWith(languageCode: locale.languageCode);
    await _repo.saveSettings(newSettings);
    emit(state.copyWith(settings: newSettings));
  }

  /// Change the haptic feedback impact of the application
  Future<void> updateHapticFeedbackImpact(String impact) async {
    final existingSettings = state.settings;
    final newSettings = existingSettings.copyWith(hapticFeedbackImpact: impact);
    await _repo.saveSettings(newSettings);
    emit(state.copyWith(settings: newSettings));
  }

  /// Load the settings from the repository
  Future<void> loadSettings() async {
    final settings = await _repo.getSettings();
    emit(state.copyWith(settings: settings));
  }
}

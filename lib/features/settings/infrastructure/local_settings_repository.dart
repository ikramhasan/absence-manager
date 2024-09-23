import 'dart:convert';

import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:absence_manager/features/settings/domain/i_settings_repository.dart';
import 'package:absence_manager/features/settings/infrastructure/constants.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Local settings repository
class LocalSettingsRepository implements ISettingsRepository {
  LocalSettingsRepository._();

  /// Singleton instance
  static final LocalSettingsRepository instance = LocalSettingsRepository._();

  // ignore: inference_failure_on_function_invocation
  final _settingsBox = Hive.box(settingsBoxName);

  @override
  Future<AppSettings> getSettings() async {
    final settings = _settingsBox.get('settings');

    if (settings == null) {
      return AppSettings.getDefault();
    }

    final settingsMap = json.decode(json.encode(settings));

    return AppSettings.fromJson(settingsMap as Map<String, dynamic>);
  }

  @override
  Future<Either<Failure, Unit>> saveSettings(AppSettings settings) async {
    try {
      await _settingsBox.put('settings', settings.toJson());
      return Future.value(right(unit));
    } catch (e) {
      return left(const Failure(code: 500, message: 'Could not save settings'));
    }
  }
}

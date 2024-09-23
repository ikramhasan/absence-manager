import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:fpdart/fpdart.dart';

/// Interface for settings repository
abstract class ISettingsRepository {
  /// Save application settings
  /// Returns [Either] a [Failure] or [Unit]
  Future<Either<Failure, Unit>> saveSettings(AppSettings settings);

  /// Get application settings, returns [AppSettings]
  /// If settings are not found, or error occurs, returns default settings
  Future<AppSettings> getSettings();
}

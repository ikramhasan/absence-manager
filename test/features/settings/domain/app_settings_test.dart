import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppSettings', () {
    test('should create an AppSettings instance using the factory constructor',
        () {
      const appSettings = AppSettings(
        isDarkTheme: true,
        languageCode: 'en',
        hapticFeedbackImpact: 'high',
      );

      expect(appSettings.isDarkTheme, true);
      expect(appSettings.languageCode, 'en');
      expect(appSettings.hapticFeedbackImpact, 'high');
    });

    test('should create an AppSettings instance from JSON', () {
      final jsonMap = {
        'isDarkTheme': true,
        'languageCode': 'en',
        'hapticFeedbackImpact': 'high',
      };
      final appSettings = AppSettings.fromJson(jsonMap);

      expect(appSettings.isDarkTheme, true);
      expect(appSettings.languageCode, 'en');
      expect(appSettings.hapticFeedbackImpact, 'high');
    });

    test('should convert an AppSettings instance to JSON', () {
      const appSettings = AppSettings(
        isDarkTheme: true,
        languageCode: 'en',
        hapticFeedbackImpact: 'high',
      );
      final json = appSettings.toJson();

      expect(json['isDarkTheme'], true);
      expect(json['languageCode'], 'en');
      expect(json['hapticFeedbackImpact'], 'high');
    });

    test('should create a default AppSettings instance', () {
      final defaultSettings = AppSettings.getDefault();

      expect(defaultSettings.isDarkTheme, false);
      expect(defaultSettings.languageCode, 'en');
      expect(defaultSettings.hapticFeedbackImpact, 'medium');
    });
  });
}

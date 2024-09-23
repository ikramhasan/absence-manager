import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Provides access to the [AppLocalizations] instance.
extension AppLocalizationsX on BuildContext {
  /// The [AppLocalizations] instance.
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Provides localization-related functionality.
class L10n {
  /// All supported languages.
  static final all = supportedLanguages.map((e) => e.locale).toList();

  /// The [Locale] of the default language.
  static final localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

/// A supported language.
class SupportedLanguage {
  /// Creates a [SupportedLanguage].
  const SupportedLanguage({
    required this.locale,
    required this.languageName,
  });

  /// The locale of the language.
  final Locale locale;

  /// The name of the language.
  final String languageName;
}

/// All supported languages.
final supportedLanguages = [
  const SupportedLanguage(locale: Locale('en'), languageName: 'English'),
  const SupportedLanguage(locale: Locale('de'), languageName: 'Deutsch'),
];

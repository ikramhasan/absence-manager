import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'AppLocalizationsX extension should return AppLocalizations instance',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetsApp(
        color: const Color(0xFFFFFFFF),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.all,
        builder: (context, _) {
          final l10n = context.l10n;
          expect(l10n, isA<AppLocalizations>());
          return const Placeholder();
        },
      ),
    );
  });

  test('L10n.all should return list of locales', () {
    final locales = L10n.all;
    expect(locales, isA<List<Locale>>());
    expect(locales.length, supportedLanguages.length);
    for (var i = 0; i < locales.length; i++) {
      expect(locales[i], supportedLanguages[i].locale);
    }
  });

  test('L10n.localizationsDelegates should contain necessary delegates', () {
    final delegates = L10n.localizationsDelegates;
    expect(delegates, contains(AppLocalizations.delegate));
    expect(delegates, contains(GlobalMaterialLocalizations.delegate));
    expect(delegates, contains(GlobalWidgetsLocalizations.delegate));
  });

  test('supportedLanguages should contain all supported languages', () {
    expect(supportedLanguages, isA<List<SupportedLanguage>>());
    expect(supportedLanguages.length, 2);
    expect(supportedLanguages[0].locale, const Locale('en'));
    expect(supportedLanguages[0].languageName, 'English');
    expect(supportedLanguages[1].locale, const Locale('de'));
    expect(supportedLanguages[1].languageName, 'German');
  });
}

import 'package:absence_manager/features/absence/presentation/components/absence_note_widget.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'absence_list_widget_test.mocks.dart';


void main() {
  late MockSettingsCubit mockSettingsCubit;

  setUp(() {
    mockSettingsCubit = MockSettingsCubit();
  });

  testWidgets('AbsenceNoteWidget rebuilds when isDarkTheme changes',
      (WidgetTester tester) async {
    const note = 'Test note';
    const author = NoteAuthor.member;

    // Initial state with isDarkTheme = false
    when(mockSettingsCubit.state).thenReturn(
      const SettingsState(
        settings: AppSettings(
          isDarkTheme: false,
          languageCode: 'en',
          hapticFeedbackImpact: 'light',
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.all,
        home: BlocProvider<SettingsCubit>.value(
          value: mockSettingsCubit,
          child: const AbsenceNoteWidget(
            author: author,
            note: note,
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.byType(RichText), findsOneWidget);

    // Change isDarkTheme to true
    when(mockSettingsCubit.state).thenReturn(
      const SettingsState(
        settings: AppSettings(
          isDarkTheme: true,
          languageCode: 'en',
          hapticFeedbackImpact: 'light',
        ),
      ),
    );

    // Trigger rebuild
    mockSettingsCubit.emit(mockSettingsCubit.state);
    await tester.pump();
    expect(find.byType(RichText), findsOneWidget);
  });
}

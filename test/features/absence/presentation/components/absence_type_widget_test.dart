import 'package:absence_manager/features/absence/presentation/components/absence_type_widget.dart';
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

  Widget buildTestWidget({
    required bool isDarkTheme,
    required String type,
  }) {
    when(mockSettingsCubit.state).thenReturn(
      SettingsState(
        settings: AppSettings(
          isDarkTheme: isDarkTheme,
          languageCode: 'en',
          hapticFeedbackImpact: 'light',
        ),
      ),
    );

    return MaterialApp(
      home: BlocProvider<SettingsCubit>.value(
        value: mockSettingsCubit,
        child: AbsenceTypeWidget(type: type),
      ),
    );
  }

  testWidgets('AbsenceTypeWidget displays correct colors in dark theme',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestWidget(isDarkTheme: true, type: 'vacation'));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration! as BoxDecoration;

    expect(
      (decoration.color!).value,
      equals(const Color(0xFF5A5A5A).withOpacity(0.67).value),
    );

    final text = tester.widget<Text>(find.byType(Text));
    expect(text.style!.color, equals(const Color(0xFFF5F5F5)));
  });

  testWidgets('AbsenceTypeWidget displays correct colors in light theme',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestWidget(isDarkTheme: false, type: 'sickness'));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration! as BoxDecoration;

    expect(decoration.color, equals(const Color(0xFFDFF5FF)));

    final text = tester.widget<Text>(find.byType(Text));
    expect(text.style!.color, equals(const Color(0xFF0065D0)));
  });

  testWidgets('AbsenceTypeWidget capitalizes the type text',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestWidget(isDarkTheme: false, type: 'vacation'));

    expect(find.text('Vacation'), findsOneWidget);
  });
}

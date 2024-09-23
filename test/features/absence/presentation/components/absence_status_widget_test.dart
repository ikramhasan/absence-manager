import 'package:absence_manager/features/absence/presentation/components/absence_status_widget.dart';
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
    DateTime? confirmedAt,
    DateTime? rejectedAt,
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
        child: AbsenceStatusWidget(
          confirmedAt: confirmedAt,
          rejectedAt: rejectedAt,
        ),
      ),
    );
  }

  testWidgets('AbsenceStatusWidget displays correct colors in dark theme',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(isDarkTheme: true));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration! as BoxDecoration;

    // Test rejected color
    expect(
      (decoration.color!).value,
      equals(const Color(0xFF5F552B).withOpacity(0.67).value),
    );

    // Test confirmed color
    await tester.pumpWidget(
      buildTestWidget(
        isDarkTheme: true,
        confirmedAt: DateTime.now(),
      ),
    );
    await tester.pumpAndSettle();

    final confirmedContainer = tester.widget<Container>(find.byType(Container));
    final confirmedDecoration = confirmedContainer.decoration! as BoxDecoration;

    expect(
      (confirmedDecoration.color!).value,
      equals(const Color(0xFF0B654A).withOpacity(0.38).value),
    );

    // Test rejected color
    await tester.pumpWidget(
      buildTestWidget(
        isDarkTheme: true,
        rejectedAt: DateTime.now(),
      ),
    );
    await tester.pumpAndSettle();

    final rejectedContainer = tester.widget<Container>(find.byType(Container));
    final rejectedDecoration = rejectedContainer.decoration! as BoxDecoration;

    expect(
      (rejectedDecoration.color!).value,
      equals(const Color(0xFF780101).withOpacity(0.54).value),
    );
  });
}

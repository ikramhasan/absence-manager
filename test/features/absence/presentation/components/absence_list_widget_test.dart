import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_card.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_list_widget.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'absence_list_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AbsenceCubit>(),
  MockSpec<AbsenceState>(),
  MockSpec<SettingsCubit>(),
  MockSpec<SettingsState>(),
])
void main() {
  late MockAbsenceCubit mockAbsenceCubit;
  late MockSettingsCubit mockSettingsCubit;
  late MockSettingsState mockSettingsState;

  setUp(() {
    mockAbsenceCubit = MockAbsenceCubit();
    mockSettingsCubit = MockSettingsCubit();
    mockSettingsState = MockSettingsState();

    when(mockSettingsCubit.state).thenReturn(mockSettingsState);
  });

  testWidgets('displays loading indicator when state is loading',
      (WidgetTester tester) async {
    when(mockAbsenceCubit.state).thenReturn(const AbsenceState.loading());

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AbsenceCubit>.value(value: mockAbsenceCubit),
          BlocProvider<SettingsCubit>.value(value: mockSettingsCubit),
        ],
        child: const MaterialApp(
          home: AbsenceListWidget(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays list of absences when state is loaded',
      (WidgetTester tester) async {
    final absences = [
      Absence(
        user: const User(
          id: 1,
          crewId: 1,
          image: 'image',
          name: 'John Doe',
          userId: 1,
        ),
        memberNote: 'Sick leave',
        admitterNote: 'Note',
        createdAt: DateTime.now(),
        crewId: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        userId: 1,
        id: 1,
        type: Type.sickness,
      ),
      Absence(
        user: const User(
          name: 'Jane Smith',
          id: 2,
          crewId: 1,
          userId: 2,
          image: 'image',
        ),
        memberNote: 'Vacation',
        admitterNote: 'Note',
        createdAt: DateTime.now(),
        crewId: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        userId: 2,
        id: 2,
        type: Type.vacation,
      ),
    ];

    when(mockSettingsCubit.state).thenReturn(
      const SettingsState(
        settings: AppSettings(
          isDarkTheme: false,
          languageCode: 'en',
          hapticFeedbackImpact: 'light',
        ),
      ),
    );

    when(mockAbsenceCubit.state).thenReturn(
      AbsenceState.loaded(
        absences: absences,
        currentPage: 1,
        totalPages: 1,
        totalAbsences: 2,
        hasMore: false,
      ),
    );

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<AbsenceCubit>.value(value: mockAbsenceCubit),
            BlocProvider<SettingsCubit>.value(value: mockSettingsCubit),
          ],
          child: MaterialApp(
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.all,
            home: const Scaffold(
              body: AbsenceListWidget(),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(AbsenceCard), findsNWidgets(2));
  });

  testWidgets('displays error message when state is error',
      (WidgetTester tester) async {
    const errorCode = 500;
    const errorMessage = 'An error occurred';
    when(mockAbsenceCubit.state).thenReturn(
      const AbsenceState.error(Failure(code: errorCode, message: errorMessage)),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AbsenceCubit>.value(value: mockAbsenceCubit),
          BlocProvider<SettingsCubit>.value(value: mockSettingsCubit),
        ],
        child: const MaterialApp(
          home: AbsenceListWidget(),
        ),
      ),
    );

    expect(find.text(errorMessage), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('loads more absences when scrolled to bottom',
      (WidgetTester tester) async {
    final absences = List.generate(
      20,
      (index) => Absence(
        user: User(
          id: index,
          crewId: 1,
          image: 'image',
          name: 'User $index',
          userId: index,
        ),
        memberNote: 'Note $index',
        admitterNote: 'Admin Note $index',
        createdAt: DateTime.now(),
        crewId: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        userId: index,
        id: index,
        type: index.isEven ? Type.sickness : Type.vacation,
      ),
    );

    when(mockSettingsCubit.state).thenReturn(
      const SettingsState(
        settings: AppSettings(
          isDarkTheme: false,
          languageCode: 'en',
          hapticFeedbackImpact: 'light',
        ),
      ),
    );

    when(mockAbsenceCubit.state).thenReturn(
      AbsenceState.loaded(
        absences: absences,
        currentPage: 1,
        totalPages: 2,
        totalAbsences: 20,
        hasMore: true,
      ),
    );

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<AbsenceCubit>.value(value: mockAbsenceCubit),
            BlocProvider<SettingsCubit>.value(value: mockSettingsCubit),
          ],
          child: MaterialApp(
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.all,
            home: const Scaffold(
              body: AbsenceListWidget(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AbsenceCard), findsWidgets);

    // Scroll to bottom
    await tester.drag(find.byType(ListView), const Offset(0, -10000));
    await tester.pumpAndSettle();

    verify(mockAbsenceCubit.loadMoreAbsences()).called(1);
  });
}

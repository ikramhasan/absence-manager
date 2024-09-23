import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_list_widget.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'absence_list_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AbsenceCubit>(), MockSpec<AbsenceState>()])
void main() {
  late MockAbsenceCubit mockAbsenceCubit;

  setUp(() {
    mockAbsenceCubit = MockAbsenceCubit();
  });

  testWidgets('displays loading indicator when state is loading',
      (WidgetTester tester) async {
    when(mockAbsenceCubit.state).thenReturn(const AbsenceState.loading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AbsenceCubit>(
          create: (_) => mockAbsenceCubit,
          child: const AbsenceListWidget(),
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
    when(mockAbsenceCubit.state).thenReturn(
      AbsenceState.loaded(
        absences: absences,
        currentPage: 1,
        totalPages: 1,
        hasMore: false,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<AbsenceCubit>(
            create: (_) => mockAbsenceCubit,
            child: const AbsenceListWidget(),
          ),
        ),
      ),
    );

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Jane Smith'), findsOneWidget);
    expect(find.text('Sick leave'), findsOneWidget);
    expect(find.text('Vacation'), findsOneWidget);
  });

  testWidgets('displays error message when state is error',
      (WidgetTester tester) async {
    const errorCode = 500;
    const errorMessage = 'An error occurred';
    when(mockAbsenceCubit.state).thenReturn(
      const AbsenceState.error(Failure(code: errorCode, message: errorMessage)),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AbsenceCubit>(
          create: (_) => mockAbsenceCubit,
          child: const AbsenceListWidget(),
        ),
      ),
    );

    expect(find.text(errorMessage), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });
}

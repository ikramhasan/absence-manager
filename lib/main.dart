import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/absence/infrastructure/local_absence_repository.dart';
import 'package:absence_manager/features/core/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AbsenceManagerApp());
}

/// A Flutter application that manages absences.
class AbsenceManagerApp extends StatelessWidget {
  /// Creates an [AbsenceManagerApp].
  const AbsenceManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAbsenceRepository>(
      create: (context) => LocalAbsenceRepository(rootBundle),
      child: BlocProvider<AbsenceCubit>(
        create: (context) => AbsenceCubit(
          RepositoryProvider.of<IAbsenceRepository>(context),
        )..fetchAbsencesWithMembers(),
        child: MaterialApp(
          title: 'Absence Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}

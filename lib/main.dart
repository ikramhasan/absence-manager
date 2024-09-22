import 'dart:io';
import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/absence/infrastructure/local_absence_repository.dart';
import 'package:absence_manager/features/core/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAbsenceRepository>(
      create: (context) => LocalAbsenceRepository(
        memberFile: File('lib/features/absence/data/members.json'),
        absenceFile: File('lib/features/absence/data/absences.json'),
      ),
      child: BlocProvider<AbsenceCubit>(
        create: (context) => AbsenceCubit(
          RepositoryProvider.of<IAbsenceRepository>(context),
        )..fetchAbsencesWithMembers(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}

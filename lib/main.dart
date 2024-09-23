import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/absence/infrastructure/local_absence_repository.dart';
import 'package:absence_manager/features/core/presentation/home_page.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/domain/i_settings_repository.dart';
import 'package:absence_manager/features/settings/infrastructure/constants.dart';
import 'package:absence_manager/features/settings/infrastructure/local_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<dynamic>(settingsBoxName);
  runApp(const AbsenceManagerApp());
}

/// A Flutter application that manages absences.
class AbsenceManagerApp extends StatelessWidget {
  /// Creates an [AbsenceManagerApp].
  const AbsenceManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IAbsenceRepository>(
          create: (context) => LocalAbsenceRepository(rootBundle),
        ),
        RepositoryProvider<ISettingsRepository>(
          create: (context) => LocalSettingsRepository.instance,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AbsenceCubit>(
            create: (context) => AbsenceCubit(
              RepositoryProvider.of<IAbsenceRepository>(context),
            )..fetchAbsencesWithMembers(),
          ),
          BlocProvider<SettingsCubit>(
            create: (context) => SettingsCubit(
              RepositoryProvider.of<ISettingsRepository>(context),
            )..loadSettings(),
          ),
        ],
        child: const RootApp(),
      ),
    );
  }
}

/// The root widget of the application.
class RootApp extends StatelessWidget {
  /// Creates a [RootApp].
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Absence Manager',
          supportedLocales: L10n.all,
          localizationsDelegates: L10n.localizationsDelegates,
          locale: Locale(state.settings.languageCode),
          debugShowCheckedModeBanner: false,
          theme:
              state.settings.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
        );
      },
    );
  }
}

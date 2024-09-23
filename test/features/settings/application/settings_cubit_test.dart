import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:absence_manager/features/settings/domain/app_settings.dart';
import 'package:absence_manager/features/settings/domain/i_settings_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'settings_cubit_test.mocks.dart';

@GenerateMocks([ISettingsRepository])
void main() {
  late MockISettingsRepository mockSettingsRepository;
  late SettingsCubit settingsCubit;

  setUpAll(() {
    provideDummy<Either<Failure, Unit>>(
      right(unit),
    );
  });

  setUp(() {
    mockSettingsRepository = MockISettingsRepository();
    settingsCubit = SettingsCubit(mockSettingsRepository);
  });

  tearDown(() {
    settingsCubit.close();
  });

  group('SettingsCubit', () {
    test('initial state is SettingsState.initial', () {
      expect(settingsCubit.state, SettingsState.initial());
    });

    blocTest<SettingsCubit, SettingsState>(
      'emits [SettingsState] with updated theme when changeTheme is called',
      build: () {
        when(mockSettingsRepository.saveSettings(any))
            .thenAnswer((_) async => right(unit));
        when(mockSettingsRepository.getSettings()).thenAnswer(
          (_) async => const AppSettings(
            isDarkTheme: true,
            languageCode: 'en',
            hapticFeedbackImpact: 'medium',
          ),
        );
        return settingsCubit;
      },
      act: (cubit) => cubit.changeTheme(),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.settings.isDarkTheme,
          'isDarkTheme',
          true,
        ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits [SettingsState] with updated language '
      'when changeLanguage is called',
      build: () {
        when(mockSettingsRepository.saveSettings(any))
            .thenAnswer((_) async => right(unit));
        return settingsCubit;
      },
      act: (cubit) => cubit.changeLanguage(const Locale('es')),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.settings.languageCode,
          'languageCode',
          'es',
        ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits [SettingsState] with updated haptic feedback impact '
      'when updateHapticFeedbackImpact is called',
      build: () {
        when(mockSettingsRepository.saveSettings(any))
            .thenAnswer((_) async => right(unit));
        return settingsCubit;
      },
      act: (cubit) => cubit.updateHapticFeedbackImpact('low'),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.settings.hapticFeedbackImpact,
          'hapticFeedbackImpact',
          'low',
        ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'emits [SettingsState] with loaded settings when loadSettings is called',
      build: () {
        when(mockSettingsRepository.getSettings()).thenAnswer(
          (_) async => const AppSettings(
            isDarkTheme: true,
            languageCode: 'en',
            hapticFeedbackImpact: 'medium',
          ),
        );
        return settingsCubit;
      },
      act: (cubit) => cubit.loadSettings(),
      expect: () => [
        isA<SettingsState>().having(
          (state) => state.settings.isDarkTheme,
          'isDarkTheme',
          true,
        ),
      ],
    );
  });
}

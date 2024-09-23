import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides haptic feedback based on the user's settings.
class AppHapticFeedback {
  /// Creates an [AppHapticFeedback].
  AppHapticFeedback(this.context);

  /// The current build context.
  final BuildContext context;

  /// Provides haptic feedback based on the user's settings.
  void provide() {
    final impact =
        context.read<SettingsCubit>().state.settings.hapticFeedbackImpact;

    switch (impact) {
      case 'light':
        HapticFeedback.lightImpact();
      case 'medium':
        HapticFeedback.mediumImpact();
      case 'heavy':
        HapticFeedback.heavyImpact();
    }
  }
}

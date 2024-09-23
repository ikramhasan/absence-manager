import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that reloads the entire absence data.
class ReloadWidget extends StatelessWidget {
  /// Creates a [ReloadWidget].
  const ReloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AbsenceCubit>().fetchAbsencesWithMembers(reset: true);
      },
      icon: const Icon(Icons.refresh_rounded),
    );
  }
}

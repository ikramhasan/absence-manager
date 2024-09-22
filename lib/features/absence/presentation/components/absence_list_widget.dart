import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget displaying a list of absences.
class AbsenceListWidget extends StatelessWidget {
  /// Creates an [AbsenceListWidget] instance.
  const AbsenceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) {
            return ListView.builder(
              itemCount: state.absences.length,
              itemBuilder: (context, index) {
                final absence = state.absences[index];
                return AbsenceCard(absence: absence);
              },
            );
          },
          error: (state) {
            return Center(
              child: Text(
                state.failure.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
        );
      },
    );
  }
}

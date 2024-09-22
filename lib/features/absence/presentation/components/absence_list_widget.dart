import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceListWidget extends StatelessWidget {
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
                return ListTile(
                  title: Text(absence.user!.name),
                  subtitle: Text(absence.memberNote),
                );
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

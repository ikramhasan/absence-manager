import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a pagination widget.
class PaginationWidget extends StatelessWidget {
  /// Creates a [PaginationWidget].
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const SizedBox();
          },
          loaded: (state) {
            return Row(
              children: [
                Text(
                  'Page ${state.currentPage} of ${state.totalPages}',
                ),
                IconButton(
                  onPressed: () {
                    context.read<AbsenceCubit>().fetchAbsencesWithMembers(
                          page: state.currentPage - 1,
                        );
                  },
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AbsenceCubit>().fetchAbsencesWithMembers(
                          page: state.currentPage + 1,
                        );
                  },
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

import 'dart:io';

import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/calendar/application/calendar_cubit.dart';
import 'package:absence_manager/features/calendar/domain/i_calendar_repository.dart';
import 'package:absence_manager/features/calendar/infrastructure/ical_calendar_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

/// A button that saves the given list of
/// [Absence] instances as iCalendar files.
class SaveCalendarButton extends StatelessWidget {
  /// Creates a [SaveCalendarButton] with the given
  /// list of [Absence] instances.
  const SaveCalendarButton({required this.absences, super.key});

  /// The list of [Absence] instances to save.
  final List<Absence> absences;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Directory?>(
      future: getDownloadsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(),
          );
        }

        final downloadsPath = snapshot.data?.path;

        return RepositoryProvider<ICalendarRepository>(
          create: (context) => ICalCalendarRepository(
            RepositoryProvider.of<IAbsenceRepository>(context),
            downloadsPath: downloadsPath ?? 'web',
          ),
          child: BlocProvider<CalendarCubit>(
            create: (context) => CalendarCubit(
              RepositoryProvider.of<ICalendarRepository>(context),
            ),
            child: _Button(absences),
          ),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(this.absences);

  final List<Absence> absences;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, CalendarState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
              ),
            );
          },
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Calendar saved to your downloads folder.'),
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return IconButton(
          onPressed: () {
            context.read<CalendarCubit>().createAndSaveCalendars(absences);
          },
          icon: isLoading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(),
                )
              : const Icon(Icons.save_alt_rounded),
        );
      },
    );
  }
}

import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:absence_manager/features/settings/application/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays an absence note.
class AbsenceNoteWidget extends StatelessWidget {
  /// Creates an [AbsenceNoteWidget].
  const AbsenceNoteWidget({
    required this.author,
    required this.note,
    super.key,
  });

  /// The author of the note.
  ///
  /// Can be of two values: 'member' or 'admitter'.
  final NoteAuthor author;

  /// The note.
  final String note;

  @override
  Widget build(BuildContext context) {
    return note.isNullOrEmpty
        ? const SizedBox.shrink()
        : BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: '${author == NoteAuthor.member
                              //
                              ? context.l10n.member
                              //
                              : context.l10n.admitter}'
                          ' ${context.l10n.note}: ',
                      children: [
                        TextSpan(
                          text: note,
                          style: TextStyle(
                            color: Color(
                              state.settings.isDarkTheme
                                  ? 0xFFF0F0F0
                                  : 0xFF8E8E93,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }
}

/// The author of the note.
enum NoteAuthor {
  /// The note was written by a member.
  member,

  /// The note was written by an admitter.
  admitter
}

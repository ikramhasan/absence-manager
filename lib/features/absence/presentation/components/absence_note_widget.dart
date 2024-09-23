import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:flutter/material.dart';

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
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: '${author == NoteAuthor.member ? 'Member' : 'Admitter'}'
                      ' Note: ',
                  children: [
                    TextSpan(
                      text: note,
                      style: const TextStyle(
                        color: Color(0xFF8E8E93),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

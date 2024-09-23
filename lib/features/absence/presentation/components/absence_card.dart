import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_note_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_status_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_type_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/data_table/date_range_row_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/user_avatar.dart';
import 'package:absence_manager/features/core/assets/resources.dart';
import 'package:absence_manager/features/core/presentation/components/widget_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Absence card widget.
class AbsenceCard extends StatelessWidget {
  /// Absence card constructor.
  ///
  /// Requires an [Absence] object.
  const AbsenceCard({required this.absence, super.key});

  /// The absence object.
  final Absence absence;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color(0xFFFDFDFD),
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar(
              imageUrl: '${absence.user!.image}'
                  '?random=${absence.user!.name}',
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    absence.user!.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Vectors.calendarOutline,
                        height: 14,
                        width: 14,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFF02D2D),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      DateRangeRowWidget(
                        startDate: absence.startDate,
                        endDate: absence.endDate,
                        size: WidgetSize.small,
                      ),
                    ],
                  ),
                  AbsenceNoteWidget(
                    author: NoteAuthor.member,
                    note: absence.memberNote,
                  ),
                  AbsenceNoteWidget(
                    author: NoteAuthor.admitter,
                    note: absence.admitterNote,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AbsenceTypeWidget(type: absence.type.name),
                const SizedBox(height: 8),
                AbsenceStatusWidget(
                  confirmedAt: absence.confirmedAt,
                  rejectedAt: absence.rejectedAt,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

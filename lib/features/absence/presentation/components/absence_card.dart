import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/presentation/components/user_avatar.dart';
import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:flutter/material.dart';

/// Absence card widget.
class AbsenceCard extends StatelessWidget {
  /// Absence card constructor.
  ///
  /// Requires an [Absence] object.
  const AbsenceCard({required this.absence, super.key});

  final Absence absence;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color.fromARGB(255, 255, 253, 248),
      elevation: 0.2,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        leading: UserAvatar(
          imageUrl: '${absence.user!.image}?random=${absence.user!.name}',
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              absence.user!.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  size: 18,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  '${absence.startDate.toFormattedString()}'
                  ' - ${absence.endDate.toFormattedString()}',
                  style: const TextStyle(
                    letterSpacing: -0.5,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (absence.memberNote.isNullOrEmpty)
                  const SizedBox.shrink()
                else
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Member Note: ',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: absence.memberNote,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                if (absence.admitterNote.isNullOrEmpty)
                  const SizedBox.shrink()
                else
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Admitter Note: ',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: absence.admitterNote,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
              ],
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                absence.type.name.capitalize(),
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: absence.rejectedAt != null
                    ? Colors.red.withOpacity(0.1)
                    : absence.confirmedAt != null
                        ? Colors.green.withOpacity(0.1)
                        : Colors.amber.withOpacity(0.1),
              ),
              child: Text(
                absence.rejectedAt != null
                    ? 'Rejected'
                    : absence.confirmedAt != null
                        ? 'Confirmed'
                        : 'Requested',
                style: TextStyle(
                  color: absence.rejectedAt != null
                      ? Colors.red
                      : absence.confirmedAt != null
                          ? const Color(0xFF3C9B62)
                          : Colors.amber[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

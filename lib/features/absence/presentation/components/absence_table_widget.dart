import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/presentation/components/user_avatar.dart';
import 'package:absence_manager/features/core/infrastructure/date_extensions.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceTableWidget extends StatelessWidget {
  const AbsenceTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) {
            return DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Image')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Period')),
                DataColumn(label: Text('Note')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Status')),
              ],
              rows: state.absences
                  .map(
                    (absence) => DataRow(
                      cells: [
                        DataCell(Text(absence.id.toString())),
                        DataCell(
                          UserAvatar(
                            imageUrl:
                                '${absence.user!.image}?random=${absence.user!.name}',
                          ),
                        ),
                        DataCell(Text(absence.user!.name)),
                        DataCell(
                          Text(
                            '${absence.startDate.toFormattedString()}'
                            '\n- ${absence.endDate.toFormattedString()}',
                            style: const TextStyle(
                              letterSpacing: -0.5,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        DataCell(
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
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
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
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
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
                        ),
                      ],
                    ),
                  )
                  .toList(),
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

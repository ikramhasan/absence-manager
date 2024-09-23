import 'package:absence_manager/features/absence/application/absence_cubit.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_date_filter_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_status_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_type_filter_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/absence_type_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/data_table/date_range_row_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/data_table/member_row_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/data_table/pagination_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/data_table/period_row_widget.dart';
import 'package:absence_manager/features/absence/presentation/components/reload_widget.dart';
import 'package:absence_manager/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a table of absences.
class AbsenceTableWidget extends StatelessWidget {
  /// Creates an [AbsenceTableWidget].
  const AbsenceTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AbsenceCubit>().fetchAbsencesWithMembers();

    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) {
            return Column(
              children: [
                const Row(
                  children: [
                    AbsenceTypeFilterWidget(),
                    SizedBox(width: 16),
                    AbsenceDateFilterWidget(),
                    Spacer(),
                    ReloadWidget(),
                    SizedBox(width: 16),
                    PaginationWidget(),
                    SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: InteractiveViewer(
                    constrained: false,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.resolveWith(
                        (states) => const Color(0xFFEAEAEA),
                      ),
                      headingTextStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      columns: [
                        DataColumn(label: Text(context.l10n.id), numeric: true),
                        DataColumn(label: Text(context.l10n.member)),
                        DataColumn(label: Text(context.l10n.date)),
                        DataColumn(label: Text(context.l10n.period)),
                        DataColumn(label: Text(context.l10n.type)),
                        DataColumn(label: Text(context.l10n.status)),
                        DataColumn(
                          label: Text(
                            '${context.l10n.member} ${context.l10n.note}',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '${context.l10n.admitter} ${context.l10n.note}',
                          ),
                        ),
                      ],
                      rows: state.absences
                          .map(
                            (absence) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    absence.id.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  MemberRowWidget(
                                    imageUrl: '${absence.user!.image}'
                                        '?random=${absence.user!.name}',
                                    userName: absence.user!.name,
                                  ),
                                ),
                                DataCell(
                                  DateRangeRowWidget(
                                    startDate: absence.startDate,
                                    endDate: absence.endDate,
                                  ),
                                ),
                                DataCell(
                                  PeriodRowWidget(
                                    startDate: absence.startDate,
                                    endDate: absence.endDate,
                                  ),
                                ),
                                DataCell(
                                  AbsenceTypeWidget(type: absence.type.name),
                                ),
                                DataCell(
                                  AbsenceStatusWidget(
                                    confirmedAt: absence.confirmedAt,
                                    rejectedAt: absence.rejectedAt,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    absence.memberNote,
                                    style: const TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 16,
                                      color: Color(0xFF5A5A5A),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    absence.admitterNote,
                                    style: const TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 16,
                                      color: Color(0xFF5A5A5A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                          
                    ),
                  ),
                ),
              ],
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

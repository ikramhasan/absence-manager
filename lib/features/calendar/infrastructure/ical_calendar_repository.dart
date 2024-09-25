import 'dart:convert';
import 'dart:io';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/calendar/domain/i_calendar_repository.dart';
import 'package:absence_manager/features/core/domain/exceptions.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/core/infrastructure/string_extensions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:icalendar/icalendar.dart';
import 'package:universal_html/html.dart' as html;

/// A repository for managing calendars in iCalendar format.
class ICalCalendarRepository implements ICalendarRepository {
  /// Creates an [ICalCalendarRepository] instance
  /// with the given [IAbsenceRepository].
  ICalCalendarRepository(
    this._absenceRepository, {
    required this.downloadsPath,
  });
  final IAbsenceRepository _absenceRepository;

  /// The path to the downloads directory.
  final String downloadsPath;

  @override
  Future<Either<Failure, Unit>> createAndSaveCalendars(
    List<Absence> absences, {
    required bool isWeb,
  }) async {
    try {
      final users = await _absenceRepository.readUsers();

      // Map users to absences
      final absencesWithUsers = absences.map((absence) {
        final user = users.firstWhere(
          (user) => user.userId == absence.userId,
          orElse: () {
            throw UserNotFoundException();
          },
        );
        return absence.copyWith(user: user);
      }).toList();

      for (final absence in absencesWithUsers) {
        final calendar = ICalendar(
          productIdentifier:
              ProductIdentifierProperty('-//Absence Manager//EN'),
          version: VersionProperty(),
        );

        final user = absence.user!;

        calendar.addComponent(
          EventComponent(
            summary: SummaryProperty(
              '${absence.type.name.capitalize()} - ${user.name}',
            ),
            description: DescriptionProperty(absence.admitterNote),
            dateTimeStart: DateTimeStartProperty(absence.startDate),
            end: DateTimeEndProperty(absence.endDate),
            attendees: [
              AttendeeProperty(
                // Will be replaced with member email
                'test-member@test.com',
                commonName: user.name,
                userType: CalendarUserType.individual,
                participationRoleType: ParticipationRoleType.reqParticipant,
              ),
              AttendeeProperty(
                // Will be replaced with admitter email
                'test-admitter@test.com',
                // Will be replaced with admitter name
                commonName: 'Admitter ID: ${absence.admitterId}',
                userType: CalendarUserType.individual,
                participationRoleType: ParticipationRoleType.reqParticipant,
              ),
            ],
            comments: [
              CommentProperty('Member Comment: ${absence.memberNote}'),
              CommentProperty('Admitter Comment: ${absence.admitterNote}'),
            ],
            uniqueIdentifier: UniqueIdentifierProperty(
              value: absence.id.toString(),
            ),
          ),
        );

        final calendarString = calendar.toString();
        await _saveCalendar(absence, calendarString, isWeb);
      }

      return right(unit);
    } on UserNotFoundException {
      return left(
        const Failure(
          code: 404,
          message: 'User not found for an absence',
        ),
      );
    } catch (e) {
      return left(
        Failure(
          code: 500,
          message: 'Failed to create and save calendars: $e',
        ),
      );
    }
  }

  Future<void> _saveCalendar(
    Absence absence,
    String calendarString,
    bool isWeb,
  ) async {
    if (isWeb) {
      await _saveCalendarForWeb(absence, calendarString);
    } else {
      await _saveCalendarForMobile(absence, calendarString);
    }
  }

  Future<void> _saveCalendarForWeb(
    Absence absence,
    String calendarString,
  ) async {
    final bytes = utf8.encode(calendarString); // Ensure proper UTF-8 encoding
    final blob = html.Blob([bytes], 'text/calendar'); // Specify MIME type
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'absence_${absence.id}.ics';
    html.document.body!.children.add(anchor);
    anchor.click();
    html.document.body!.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> _saveCalendarForMobile(
    Absence absence,
    String calendarString,
  ) async {
    final file = File('$downloadsPath/absence_${absence.id}.ics');
    await file.writeAsString(calendarString);
  }
}

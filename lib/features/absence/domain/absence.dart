import 'package:absence_manager/features/core/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence.freezed.dart';
part 'absence.g.dart';

@freezed

/// A class representing an absence.
class Absence with _$Absence {
  /// The [Absence] class has the following properties:
  ///
  /// - [admitterNote]: A note from the admitter.
  /// - [createdAt]: The date and time the absence was created.
  /// - [crewId]: The identifier for the crew the absence belongs to.
  /// - [startDate]: The date and time the absence starts.
  /// - [endDate]: The date and time the absence ends.
  /// - [id]: The unique identifier for the absence.
  /// - [memberNote]: A note from the member.
  /// - [userId]: The identifier for the user the absence belongs to.
  /// - [type]: The type of absence.
  /// - [rejectedAt]: The date and time the absence was rejected.
  /// - [admitterId]: The identifier for the admitter.
  /// - [confirmedAt]: The date and time the absence was confirmed.
  const factory Absence({
    required String admitterNote,
    required DateTime createdAt,
    required int crewId,
    required DateTime startDate,
    required DateTime endDate,
    required int id,
    required String memberNote,
    required int userId,
    required Type type,
    DateTime? rejectedAt,
    int? admitterId,
    DateTime? confirmedAt,
    User? user,
  }) = _Absence;

  /// Creates an [Absence] instance from a JSON object.
  factory Absence.fromJson(Map<String, dynamic> json) =>
      _$AbsenceFromJson(json);

  /// Creates an empty [Absence] instance.
  factory Absence.empty() => _Absence(
        admitterNote: '',
        createdAt: DateTime(2021),
        crewId: 0,
        startDate: DateTime(2021),
        endDate: DateTime(2021),
        confirmedAt: DateTime(2021),
        rejectedAt: DateTime(2021),
        id: 0,
        memberNote: '',
        userId: 0,
        type: Type.sickness,
      );
}

@JsonEnum()
/// An enum representing the type of absence.
enum Type {
  @JsonValue('sickness')
  /// Sickness related absence.
  sickness,

  @JsonValue('vacation')
  /// Vacation related absence.
  vacation
}

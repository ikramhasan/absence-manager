// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsenceImpl _$$AbsenceImplFromJson(Map<String, dynamic> json) =>
    _$AbsenceImpl(
      admitterNote: json['admitterNote'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      crewId: (json['crewId'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      id: (json['id'] as num).toInt(),
      memberNote: json['memberNote'] as String,
      userId: (json['userId'] as num).toInt(),
      type: $enumDecode(_$TypeEnumMap, json['type']),
      rejectedAt: json['rejectedAt'] == null
          ? null
          : DateTime.parse(json['rejectedAt'] as String),
      admitterId: (json['admitterId'] as num?)?.toInt(),
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AbsenceImplToJson(_$AbsenceImpl instance) =>
    <String, dynamic>{
      'admitterNote': instance.admitterNote,
      'createdAt': instance.createdAt.toIso8601String(),
      'crewId': instance.crewId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'id': instance.id,
      'memberNote': instance.memberNote,
      'userId': instance.userId,
      'type': _$TypeEnumMap[instance.type]!,
      'rejectedAt': instance.rejectedAt?.toIso8601String(),
      'admitterId': instance.admitterId,
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'user': instance.user?.toJson(),
    };

const _$TypeEnumMap = {
  Type.sickness: 'sickness',
  Type.vacation: 'vacation',
};

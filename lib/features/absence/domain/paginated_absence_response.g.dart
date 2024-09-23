// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_absence_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedAbsenceResponseImpl _$$PaginatedAbsenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedAbsenceResponseImpl(
      absences: (json['absences'] as List<dynamic>)
          .map((e) => Absence.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalAbsences: (json['totalAbsences'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginatedAbsenceResponseImplToJson(
        _$PaginatedAbsenceResponseImpl instance) =>
    <String, dynamic>{
      'absences': instance.absences.map((e) => e.toJson()).toList(),
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalAbsences': instance.totalAbsences,
    };

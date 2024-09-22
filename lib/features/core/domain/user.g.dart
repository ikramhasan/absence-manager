// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      crewId: (json['crewId'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'crewId': instance.crewId,
      'name': instance.name,
      'image': instance.image,
      'userId': instance.userId,
    };

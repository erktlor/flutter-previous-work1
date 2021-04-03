// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return ResultModel(
    id: json['id'] as String,
    watched: json['watched'] as bool,
    favourite: json['favourite'] as bool,
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watched': instance.watched,
      'favourite': instance.favourite,
      'notes': instance.notes,
    };

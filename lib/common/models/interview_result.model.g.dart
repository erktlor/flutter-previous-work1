// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InterviewResultModel _$_$_InterviewResultModelFromJson(
    Map<String, dynamic> json) {
  return _$_InterviewResultModel(
    favourite: json['favourite'] as bool,
    watched: json['watched'] as bool,
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$_$_InterviewResultModelToJson(
        _$_InterviewResultModel instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'watched': instance.watched,
      'notes': instance.notes,
    };

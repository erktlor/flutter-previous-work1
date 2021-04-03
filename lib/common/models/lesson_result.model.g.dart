// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonResultModel _$_$_LessonResultModelFromJson(Map<String, dynamic> json) {
  return _$_LessonResultModel(
    id: json['id'] as String,
    lessonId: json['lessonId'] as String,
    favourite: json['favourite'] as bool,
    watched: json['watched'] as bool,
    notes: json['notes'] as String,
    updatedAt: json['updatedAt'] as String,
    topicsResults: (json['topicsResults'] as List)
        ?.map((e) => e == null
            ? null
            : TopicResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_LessonResultModelToJson(
        _$_LessonResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lessonId': instance.lessonId,
      'favourite': instance.favourite,
      'watched': instance.watched,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt,
      'topicsResults': instance.topicsResults,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseResultModel _$_$_CourseResultModelFromJson(Map<String, dynamic> json) {
  return _$_CourseResultModel(
    favourite: json['favourite'] as bool,
    watched: json['watched'] as bool,
    notes: json['notes'] as String,
    updatedAt: json['updatedAt'] as String,
    lessonsResults: (json['lessonsResults'] as List)
        ?.map((e) => e == null
            ? null
            : LessonResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_CourseResultModelToJson(
        _$_CourseResultModel instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'watched': instance.watched,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt,
      'lessonsResults': instance.lessonsResults,
    };

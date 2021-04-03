// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoursesState _$_$_CoursesStateFromJson(Map<String, dynamic> json) {
  return _$_CoursesState(
    searchCourses: (json['searchCourses'] as List)
        ?.map((e) => e == null
            ? null
            : SearchContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    course: json['course'] == null
        ? null
        : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
    courseResult: json['courseResult'] == null
        ? null
        : CourseResultModel.fromJson(
            json['courseResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CoursesStateToJson(_$_CoursesState instance) =>
    <String, dynamic>{
      'searchCourses': instance.searchCourses,
      'course': instance.course,
      'courseResult': instance.courseResult,
    };

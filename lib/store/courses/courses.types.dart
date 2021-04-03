import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses.types.freezed.dart';
part 'courses.types.g.dart';

@freezed
abstract class CoursesState with _$CoursesState {
  const factory CoursesState(
      {@required List<SearchContentModel> searchCourses,
      CourseModel course,
      CourseResultModel courseResult}) = _CoursesState;

  factory CoursesState.initialState() =>
      CoursesState(searchCourses: [], course: null, courseResult: null);

  factory CoursesState.fromJson(Map<String, dynamic> json) =>
      _$CoursesStateFromJson(json);
}

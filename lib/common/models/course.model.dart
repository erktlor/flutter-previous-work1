import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.model.g.dart';

@JsonSerializable()
class CourseModel {
  final String id;
  final String name;
  final String videoUri;
  final String featuredImageUri;
  final String text;
  final bool published;
  final List<SubjectModel> subjects;
  final List<LessonModel> lessons;
  final List<PresenterModel> presenters;
  final String createdAt;
  final String publishedAt;

  CourseModel({
    @required this.id,
    @required this.name,
    @required this.videoUri,
    @required this.featuredImageUri,
    @required this.text,
    @required this.published,
    @required this.subjects,
    @required this.lessons,
    @required this.presenters,
    @required this.createdAt,
    @required this.publishedAt,
  });

  getLessonById(String lessonId) {
    return this
        .lessons
        .firstWhere((lesson) => lesson.id == lessonId, orElse: () => null);
  }

  getNextLesson(LessonModel lesson) {
    final lessonIndex = lessons.indexOf(lesson);

    if (lessonIndex == -1) {
      return null;
    }

    final nextLessonIndex = lessonIndex + 1;

    if (nextLessonIndex != lessons.length) {
      return lessons.elementAt(nextLessonIndex);
    } else {
      return null;
    }
  }

  getPreviousLesson(LessonModel lesson) {
    final lessonIndex = lessons.indexOf(lesson);

    if (lessonIndex == -1) {
      return null;
    }

    final previousLessonIndex = lessonIndex - 1;

    if (previousLessonIndex >= 0) {
      return lessons.elementAt(previousLessonIndex);
    } else {
      return null;
    }
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

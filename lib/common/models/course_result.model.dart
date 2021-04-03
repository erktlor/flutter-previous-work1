import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_result.model.freezed.dart';
part 'course_result.model.g.dart';

@freezed
abstract class CourseResultModel with _$CourseResultModel {
  const CourseResultModel._();

  const factory CourseResultModel({
    @required bool favourite,
    @required bool watched,
    @required String notes,
    @required String updatedAt,
    @required List<LessonResultModel> lessonsResults,
  }) = _CourseResultModel;

  DateTime get lastActivity {
    List<DateTime> dates =
        lessonsResults.map((e) => DateTime.parse(e.updatedAt)).toList();

    dates.add(DateTime.parse(updatedAt));

    dates.sort((first, second) => first.compareTo(second));

    return dates.last.toLocal();
  }

  get progress {
    if (lessonsResults.length == 0) {
      return 0;
    }

    return double.parse(
        (lessonsResults.where((element) => element.watched).length /
                lessonsResults.length)
            .toStringAsFixed(2));
  }

  bool isLessonWatched(LessonModel lesson) {
    LessonResultModel lessonResult = lessonsResults.firstWhere(
        (lessonResult) => lessonResult.lessonId == lesson.id,
        orElse: () => null);

    if (lessonResult == null) {
      return false;
    }

    return lessonResult.watched;
  }

  LessonResultModel getLessonResult(String lessonId) {
    return lessonsResults.firstWhere(
        (lessonResult) => lessonResult.lessonId == lessonId,
        orElse: () => null);
  }

  TopicResultModel getTopicResult(String topicId) {
    for (var i = 0; i < lessonsResults.length; i++) {
      final lessonResult = lessonsResults[i];

      for (var j = 0; j < lessonResult.topicsResults.length; j++) {
        final topicResult = lessonResult.topicsResults[j];

        if (topicResult.topicId == topicId) {
          return topicResult;
        }
      }
    }

    return null;
  }

  factory CourseResultModel.fromJson(Map<String, dynamic> json) =>
      _$CourseResultModelFromJson(json);
}

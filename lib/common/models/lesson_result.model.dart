import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_result.model.freezed.dart';
part 'lesson_result.model.g.dart';

@freezed
abstract class LessonResultModel with _$LessonResultModel {
  const LessonResultModel._();

  const factory LessonResultModel(
      {@required String id,
      @required String lessonId,
      @required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<TopicResultModel> topicsResults}) = _LessonResultModel;

  get progress {
    if (topicsResults.length == 0) {
      return 0;
    }

    return double.parse(
        (topicsResults.where((element) => element.watched).length /
                topicsResults.length)
            .toStringAsFixed(2));
  }

  factory LessonResultModel.fromJson(Map<String, dynamic> json) =>
      _$LessonResultModelFromJson(json);
}

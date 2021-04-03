import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_result.model.freezed.dart';
part 'topic_result.model.g.dart';

@freezed
abstract class TopicResultModel with _$TopicResultModel {
  const factory TopicResultModel({
    @required String topicId,
    @required bool favourite,
    @required bool watched,
    @required String notes,
    @required String updatedAt,
    @required List<FileModel> files,
  }) = _TopicResultModel;

  factory TopicResultModel.fromJson(Map<String, dynamic> json) =>
      _$TopicResultModelFromJson(json);
}

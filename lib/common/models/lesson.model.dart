import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.model.g.dart';

@JsonSerializable()
class LessonModel {
  final String id;
  final String name;
  final String audioUri;
  final List<String> videos;
  final String text;
  final List<FileModel> files;
  final List<TopicModel> topics;
  final String publishedAt;

  LessonModel(
      {@required this.id,
      @required this.name,
      @required this.audioUri,
      @required this.videos,
      @required this.text,
      @required this.files,
      @required this.topics,
      @required this.publishedAt});

  getNextTopic(TopicModel topic) {
    final topicIndex = topics.indexOf(topic);

    if (topicIndex == -1) {
      return null;
    }

    final nextTopicIndex = topicIndex + 1;

    if (nextTopicIndex != topics.length) {
      return topics.elementAt(nextTopicIndex);
    } else {
      return null;
    }
  }

  getPreviousTopic(TopicModel topic) {
    final topicIndex = topics.indexOf(topic);

    if (topicIndex == -1) {
      return null;
    }

    final previousTopicIndex = topicIndex - 1;

    if (previousTopicIndex >= 0) {
      return topics.elementAt(previousTopicIndex);
    } else {
      return null;
    }
  }

  getTopicById(String topicId) {
    return topics.firstWhereOrNull((topic) => topic.id == topicId);
  }

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);
  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}

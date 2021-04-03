import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.model.g.dart';

@JsonSerializable()
class TopicModel {
  final String id;
  final String name;
  final String text;
  final List<FileModel> files;
  final bool uploadsEnabled;

  TopicModel(
      {@required this.id,
      @required this.name,
      @required this.text,
      @required this.files,
      @required this.uploadsEnabled});

  factory TopicModel.fromJson(Map<String, dynamic> json) =>
      _$TopicModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopicModelToJson(this);
}

import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/result.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast.model.g.dart';

@JsonSerializable()
class PodcastModel {
  final String id;
  final String name;
  final bool published;
  final List<FileModel> audios;
  final String createdAt;
  final String publishedAt;
  final ResultModel result;
  final List<PresenterModel> presenters;
  final List<SubjectModel> subjects;

  PodcastModel({
    @required this.id,
    @required this.name,
    @required this.published,
    @required this.audios,
    @required this.createdAt,
    @required this.publishedAt,
    @required this.result,
    @required this.presenters,
    @required this.subjects,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) =>
      _$PodcastModelFromJson(json);
  Map<String, dynamic> toJson() => _$PodcastModelToJson(this);
}

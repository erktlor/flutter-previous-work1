import 'package:flutter/cupertino.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/section.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview.model.g.dart';

@JsonSerializable()
class InterviewModel {
  final String id;
  final bool published;
  final String name;
  final String description;
  final int duration;
  final String featuredImageUri;
  final String videoUri;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final List<SectionModel> sections;
  final List<PresenterModel> presenters;
  final List<SubjectModel> subjects;
  final bool watched;
  final bool favourite;

  InterviewModel(
      {@required this.id,
      @required this.published,
      @required this.name,
      @required this.description,
      @required this.duration,
      @required this.featuredImageUri,
      @required this.videoUri,
      @required this.createdAt,
      @required this.publishedAt,
      @required this.updatedAt,
      @required this.sections,
      @required this.presenters,
      @required this.subjects,
      this.watched = false,
      this.favourite = false});

  factory InterviewModel.fromJson(Map<String, dynamic> json) =>
      _$InterviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$InterviewModelToJson(this);
}

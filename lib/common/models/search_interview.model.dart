import 'package:flutter/cupertino.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_interview.model.g.dart';

@JsonSerializable()
class SearchInterviewModel {
  final String id;
  final String name;
  final String publishedAt;
  final List<PresenterModel> presenters;
  final List<SubjectModel> subjects;
  final String featuredImageUri;
  final String description;
  final bool watched;
  final bool favourite;
  final int duration;

  SearchInterviewModel(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.duration,
      @required this.featuredImageUri,
      @required this.publishedAt,
      @required this.presenters,
      @required this.subjects,
      @required this.watched,
      @required this.favourite});

  factory SearchInterviewModel.fromJson(Map<String, dynamic> json) =>
      _$SearchInterviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInterviewModelToJson(this);
}

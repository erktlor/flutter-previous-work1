import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_content.model.g.dart';

@JsonSerializable()
class SearchContentModel {
  final String type;
  final String name;
  final String description;
  final String parameters;
  final List<SubjectModel> subjects;
  final List<PresenterModel> presenters;
  final String publishedAt;
  final bool watched;
  final bool favourite;
  final String imageUri;
  final int duration;

  SearchContentModel(
      {@required this.type,
      @required this.name,
      @required this.description,
      @required this.parameters,
      @required this.subjects,
      @required this.presenters,
      @required this.publishedAt,
      @required this.watched,
      @required this.favourite,
      this.imageUri,
      this.duration});

  factory SearchContentModel.fromJson(Map<String, dynamic> json) =>
      _$SearchContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchContentModelToJson(this);
}

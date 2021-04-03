import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.model.g.dart';

@JsonSerializable()
class SubjectModel {
  final String id;
  final String name;
  final String imageUri;

  SubjectModel(
      {@required this.id, @required this.name, @required this.imageUri});

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}

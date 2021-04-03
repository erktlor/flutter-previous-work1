import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subjects_content_count.model.g.dart';

@JsonSerializable()
class SubjectsContentCountModel {
  final SubjectModel subject;
  final int count;

  SubjectsContentCountModel({
    @required this.subject,
    @required this.count,
  });

  factory SubjectsContentCountModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectsContentCountModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectsContentCountModelToJson(this);
}

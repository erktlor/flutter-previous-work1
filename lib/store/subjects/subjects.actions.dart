import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subjects.actions.g.dart';

// Get subjects content count
class GetSubjectsContentCountAction {}

class GetSubjectsContentCountRequestAction {}

@JsonSerializable()
class GetSubjectsContentCountSuccessAction {
  final List<SubjectsContentCountModel> subjectsContentCount;

  GetSubjectsContentCountSuccessAction({@required this.subjectsContentCount});

  factory GetSubjectsContentCountSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetSubjectsContentCountSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetSubjectsContentCountSuccessActionToJson(this);
}

class GetSubjectsContentCountFailureAction {}

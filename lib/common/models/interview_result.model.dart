import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview_result.model.freezed.dart';
part 'interview_result.model.g.dart';

@freezed
abstract class InterviewResultModel with _$InterviewResultModel {
  const factory InterviewResultModel(
      {@required bool favourite,
      @required bool watched,
      @required String notes}) = _InterviewResultModel;

  factory InterviewResultModel.fromJson(Map<String, dynamic> json) =>
      _$InterviewResultModelFromJson(json);
}

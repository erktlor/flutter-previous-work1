import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/interview_result.model.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interviews.types.freezed.dart';
part 'interviews.types.g.dart';

@freezed
abstract class InterviewsState with _$InterviewsState {
  const factory InterviewsState(
      {@required List<SearchInterviewModel> interviews,
      InterviewModel interview,
      InterviewResultModel interviewResult,
      @required bool kickstartVisible}) = _InterviewsState;

  factory InterviewsState.initialState() => const InterviewsState(
      interviews: [],
      interview: null,
      interviewResult: null,
      kickstartVisible: false);

  factory InterviewsState.fromJson(Map<String, dynamic> json) =>
      _$InterviewsStateFromJson(json);
}

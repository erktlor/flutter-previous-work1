import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/interview_result.model.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interviews.actions.g.dart';

// Get interviews
@JsonSerializable()
class GetInterviewsAction {
  final String type;

  GetInterviewsAction({@required this.type});

  factory GetInterviewsAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewsActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterviewsActionToJson(this);
}

class GetInterviewsRequestAction {}

@JsonSerializable()
class GetInterviewsSuccessAction {
  final List<SearchInterviewModel> interviews;

  GetInterviewsSuccessAction({@required this.interviews});

  factory GetInterviewsSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewsSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterviewsSuccessActionToJson(this);
}

class GetInterviewsFailureAction {}

// Get interview
@JsonSerializable()
class GetInterviewAction {
  final String interviewId;

  GetInterviewAction({@required this.interviewId});

  factory GetInterviewAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterviewActionToJson(this);
}

class GetInterviewRequestAction {}

@JsonSerializable()
class GetInterviewSuccessAction {
  final InterviewModel interview;

  GetInterviewSuccessAction({@required this.interview});

  factory GetInterviewSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterviewSuccessActionToJson(this);
}

class GetInterviewFailureAction {}

// Get interview result
@JsonSerializable()
class GetInterviewResultAction {
  final String interviewId;

  GetInterviewResultAction({@required this.interviewId});

  factory GetInterviewResultAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewResultActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInterviewResultActionToJson(this);
}

class GetInterviewResultRequestAction {}

@JsonSerializable()
class GetInterviewResultSuccessAction {
  final InterviewResultModel interviewResult;

  GetInterviewResultSuccessAction({@required this.interviewResult});

  factory GetInterviewResultSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetInterviewResultSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetInterviewResultSuccessActionToJson(this);
}

class GetInterviewResultFailureAction {}

// Update interview result
@JsonSerializable()
class UpdateInterviewResultAction {
  final String interviewId;
  final InterviewResultModel interviewResult;

  UpdateInterviewResultAction(
      {@required this.interviewId, @required this.interviewResult});

  factory UpdateInterviewResultAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateInterviewResultActionFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateInterviewResultActionToJson(this);
}

class UpdateInterviewResultRequestAction {}

@JsonSerializable()
class UpdateInterviewResultSuccessAction {
  final InterviewResultModel interviewResult;

  UpdateInterviewResultSuccessAction({@required this.interviewResult});

  factory UpdateInterviewResultSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateInterviewResultSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdateInterviewResultSuccessActionToJson(this);
}

class UpdateInterviewResultFailureAction {}

// Get kickstart visibility
class GetInterviewKickstartVisibilityAction {}

class GetInterviewKickstartVisibilityRequestAction {}

@JsonSerializable()
class GetInterviewKickstartVisibilitySuccessAction {
  final bool visible;

  GetInterviewKickstartVisibilitySuccessAction({@required this.visible});

  factory GetInterviewKickstartVisibilitySuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetInterviewKickstartVisibilitySuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetInterviewKickstartVisibilitySuccessActionToJson(this);
}

class GetInterviewKickstartVisibilityFailureAction {}

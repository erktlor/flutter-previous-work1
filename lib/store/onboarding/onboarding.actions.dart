import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.actions.g.dart';

// Get subjects
class GetOnboardingSubjectsAction {}

class GetOnboardingSubjectsRequestAction {}

@JsonSerializable()
class GetOnboardingSubjectsSuccessAction {
  final List<SubjectModel> subjects;

  GetOnboardingSubjectsSuccessAction({@required this.subjects});

  factory GetOnboardingSubjectsSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetOnboardingSubjectsSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetOnboardingSubjectsSuccessActionToJson(this);
}

// Select subject
@JsonSerializable()
class SelectOnboardingSubjectAction {
  final SubjectModel subject;

  SelectOnboardingSubjectAction({@required this.subject});

  factory SelectOnboardingSubjectAction.fromJson(Map<String, dynamic> json) =>
      _$SelectOnboardingSubjectActionFromJson(json);
  Map<String, dynamic> toJson() => _$SelectOnboardingSubjectActionToJson(this);
}

class GetOnboardingSubjectsFailureAction {}

// Get avatars
class GetOnboardingAvatarsAction {}

class GetOnboardingAvatarsRequestAction {}

@JsonSerializable()
class GetOnboardingAvatarsSuccessAction {
  final List<AvatarModel> avatars;

  GetOnboardingAvatarsSuccessAction({@required this.avatars});

  factory GetOnboardingAvatarsSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetOnboardingAvatarsSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetOnboardingAvatarsSuccessActionToJson(this);
}

class GetOnboardingAvatarsFailureAction {}

// Select avatar
@JsonSerializable()
class SelectOnboardingAvatarAction {
  final AvatarModel avatar;

  SelectOnboardingAvatarAction({@required this.avatar});

  factory SelectOnboardingAvatarAction.fromJson(Map<String, dynamic> json) =>
      _$SelectOnboardingAvatarActionFromJson(json);
  Map<String, dynamic> toJson() => _$SelectOnboardingAvatarActionToJson(this);
}

// Save onboarding results
class SaveOnboardingResultsAction {}

class SaveOnboardingResultsRequestAction {}

class SaveOnboardingResultsSuccessAction {}

class SaveOnboardingResultsFailureAction {}

// Get onboarding results
class GetOnboardingResultsAction {}

class GetOnboardingResultsRequestAction {}

@JsonSerializable()
class GetOnboardingResultsSuccessAction {
  final List<SubjectModel> subjects;
  final AvatarModel avatar;

  GetOnboardingResultsSuccessAction(
      {@required this.subjects, @required this.avatar});

  factory GetOnboardingResultsSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetOnboardingResultsSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetOnboardingResultsSuccessActionToJson(this);
}

class GetOnboardingResultsFailureAction {}

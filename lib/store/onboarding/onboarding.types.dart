import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding.types.freezed.dart';
part 'onboarding.types.g.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @required List<SubjectModel> subjects,
    @required List<SubjectModel> selectedSubjects,
    @required List<AvatarModel> avatars,
    AvatarModel selectedAvatar,
  }) = _OnboardingState;

  factory OnboardingState.initialState() => const OnboardingState(
      subjects: [], selectedSubjects: [], avatars: [], selectedAvatar: null);

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}

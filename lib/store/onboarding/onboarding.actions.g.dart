// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOnboardingSubjectsSuccessAction _$GetOnboardingSubjectsSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetOnboardingSubjectsSuccessAction(
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetOnboardingSubjectsSuccessActionToJson(
        GetOnboardingSubjectsSuccessAction instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
    };

SelectOnboardingSubjectAction _$SelectOnboardingSubjectActionFromJson(
    Map<String, dynamic> json) {
  return SelectOnboardingSubjectAction(
    subject: json['subject'] == null
        ? null
        : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SelectOnboardingSubjectActionToJson(
        SelectOnboardingSubjectAction instance) =>
    <String, dynamic>{
      'subject': instance.subject,
    };

GetOnboardingAvatarsSuccessAction _$GetOnboardingAvatarsSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetOnboardingAvatarsSuccessAction(
    avatars: (json['avatars'] as List)
        ?.map((e) =>
            e == null ? null : AvatarModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetOnboardingAvatarsSuccessActionToJson(
        GetOnboardingAvatarsSuccessAction instance) =>
    <String, dynamic>{
      'avatars': instance.avatars,
    };

SelectOnboardingAvatarAction _$SelectOnboardingAvatarActionFromJson(
    Map<String, dynamic> json) {
  return SelectOnboardingAvatarAction(
    avatar: json['avatar'] == null
        ? null
        : AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SelectOnboardingAvatarActionToJson(
        SelectOnboardingAvatarAction instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

GetOnboardingResultsSuccessAction _$GetOnboardingResultsSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetOnboardingResultsSuccessAction(
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    avatar: json['avatar'] == null
        ? null
        : AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetOnboardingResultsSuccessActionToJson(
        GetOnboardingResultsSuccessAction instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
      'avatar': instance.avatar,
    };

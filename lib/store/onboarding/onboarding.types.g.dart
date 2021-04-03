// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingState _$_$_OnboardingStateFromJson(Map<String, dynamic> json) {
  return _$_OnboardingState(
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    selectedSubjects: (json['selectedSubjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    avatars: (json['avatars'] as List)
        ?.map((e) =>
            e == null ? null : AvatarModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    selectedAvatar: json['selectedAvatar'] == null
        ? null
        : AvatarModel.fromJson(json['selectedAvatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
      'selectedSubjects': instance.selectedSubjects,
      'avatars': instance.avatars,
      'selectedAvatar': instance.selectedAvatar,
    };

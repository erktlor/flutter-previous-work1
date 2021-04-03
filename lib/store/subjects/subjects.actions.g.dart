// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubjectsContentCountSuccessAction
    _$GetSubjectsContentCountSuccessActionFromJson(Map<String, dynamic> json) {
  return GetSubjectsContentCountSuccessAction(
    subjectsContentCount: (json['subjectsContentCount'] as List)
        ?.map((e) => e == null
            ? null
            : SubjectsContentCountModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetSubjectsContentCountSuccessActionToJson(
        GetSubjectsContentCountSuccessAction instance) =>
    <String, dynamic>{
      'subjectsContentCount': instance.subjectsContentCount,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubjectsState _$_$_SubjectsStateFromJson(Map<String, dynamic> json) {
  return _$_SubjectsState(
    subjectsContentCount: (json['subjectsContentCount'] as List)
        ?.map((e) => e == null
            ? null
            : SubjectsContentCountModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_SubjectsStateToJson(_$_SubjectsState instance) =>
    <String, dynamic>{
      'subjectsContentCount': instance.subjectsContentCount,
    };

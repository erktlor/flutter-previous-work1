// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicResultModel _$_$_TopicResultModelFromJson(Map<String, dynamic> json) {
  return _$_TopicResultModel(
    topicId: json['topicId'] as String,
    favourite: json['favourite'] as bool,
    watched: json['watched'] as bool,
    notes: json['notes'] as String,
    updatedAt: json['updatedAt'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_TopicResultModelToJson(
        _$_TopicResultModel instance) =>
    <String, dynamic>{
      'topicId': instance.topicId,
      'favourite': instance.favourite,
      'watched': instance.watched,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt,
      'files': instance.files,
    };

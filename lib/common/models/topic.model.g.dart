// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) {
  return TopicModel(
    id: json['id'] as String,
    name: json['name'] as String,
    text: json['text'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    uploadsEnabled: json['uploadsEnabled'] as bool,
  );
}

Map<String, dynamic> _$TopicModelToJson(TopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'files': instance.files,
      'uploadsEnabled': instance.uploadsEnabled,
    };

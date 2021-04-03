// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) {
  return LessonModel(
    id: json['id'] as String,
    name: json['name'] as String,
    audioUri: json['audioUri'] as String,
    videos: (json['videos'] as List)?.map((e) => e as String)?.toList(),
    text: json['text'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topics: (json['topics'] as List)
        ?.map((e) =>
            e == null ? null : TopicModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publishedAt: json['publishedAt'] as String,
  );
}

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'audioUri': instance.audioUri,
      'videos': instance.videos,
      'text': instance.text,
      'files': instance.files,
      'topics': instance.topics,
      'publishedAt': instance.publishedAt,
    };

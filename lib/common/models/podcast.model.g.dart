// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastModel _$PodcastModelFromJson(Map<String, dynamic> json) {
  return PodcastModel(
    id: json['id'] as String,
    name: json['name'] as String,
    published: json['published'] as bool,
    audios: (json['audios'] as List)
        ?.map((e) =>
            e == null ? null : FileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['createdAt'] as String,
    publishedAt: json['publishedAt'] as String,
    result: json['result'] == null
        ? null
        : ResultModel.fromJson(json['result'] as Map<String, dynamic>),
    presenters: (json['presenters'] as List)
        ?.map((e) => e == null
            ? null
            : PresenterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PodcastModelToJson(PodcastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'published': instance.published,
      'audios': instance.audios,
      'createdAt': instance.createdAt,
      'publishedAt': instance.publishedAt,
      'result': instance.result,
      'presenters': instance.presenters,
      'subjects': instance.subjects,
    };

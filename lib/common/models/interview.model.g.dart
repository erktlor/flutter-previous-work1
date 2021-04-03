// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewModel _$InterviewModelFromJson(Map<String, dynamic> json) {
  return InterviewModel(
    id: json['id'] as String,
    published: json['published'] as bool,
    name: json['name'] as String,
    description: json['description'] as String,
    duration: json['duration'] as int,
    featuredImageUri: json['featuredImageUri'] as String,
    videoUri: json['videoUri'] as String,
    createdAt: json['createdAt'] as String,
    publishedAt: json['publishedAt'] as String,
    updatedAt: json['updatedAt'] as String,
    sections: (json['sections'] as List)
        ?.map((e) =>
            e == null ? null : SectionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    presenters: (json['presenters'] as List)
        ?.map((e) => e == null
            ? null
            : PresenterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    watched: json['watched'] as bool,
    favourite: json['favourite'] as bool,
  );
}

Map<String, dynamic> _$InterviewModelToJson(InterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'published': instance.published,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'featuredImageUri': instance.featuredImageUri,
      'videoUri': instance.videoUri,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'sections': instance.sections,
      'presenters': instance.presenters,
      'subjects': instance.subjects,
      'watched': instance.watched,
      'favourite': instance.favourite,
    };

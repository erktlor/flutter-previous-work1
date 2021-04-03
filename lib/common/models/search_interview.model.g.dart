// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_interview.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchInterviewModel _$SearchInterviewModelFromJson(Map<String, dynamic> json) {
  return SearchInterviewModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    duration: json['duration'] as int,
    featuredImageUri: json['featuredImageUri'] as String,
    publishedAt: json['publishedAt'] as String,
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

Map<String, dynamic> _$SearchInterviewModelToJson(
        SearchInterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'publishedAt': instance.publishedAt,
      'presenters': instance.presenters,
      'subjects': instance.subjects,
      'featuredImageUri': instance.featuredImageUri,
      'description': instance.description,
      'watched': instance.watched,
      'favourite': instance.favourite,
      'duration': instance.duration,
    };

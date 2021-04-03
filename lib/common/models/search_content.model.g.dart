// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_content.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchContentModel _$SearchContentModelFromJson(Map<String, dynamic> json) {
  return SearchContentModel(
    type: json['type'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    parameters: json['parameters'] as String,
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    presenters: (json['presenters'] as List)
        ?.map((e) => e == null
            ? null
            : PresenterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publishedAt: json['publishedAt'] as String,
    watched: json['watched'] as bool,
    favourite: json['favourite'] as bool,
    imageUri: json['imageUri'] as String,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$SearchContentModelToJson(SearchContentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'parameters': instance.parameters,
      'subjects': instance.subjects,
      'presenters': instance.presenters,
      'publishedAt': instance.publishedAt,
      'watched': instance.watched,
      'favourite': instance.favourite,
      'imageUri': instance.imageUri,
      'duration': instance.duration,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PodcastResultModel _$_$_PodcastResultModelFromJson(
    Map<String, dynamic> json) {
  return _$_PodcastResultModel(
    favourite: json['favourite'] as bool,
    watched: json['watched'] as bool,
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$_$_PodcastResultModelToJson(
        _$_PodcastResultModel instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'watched': instance.watched,
      'notes': instance.notes,
    };

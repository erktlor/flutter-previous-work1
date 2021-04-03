// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcasts.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PodcastsState _$_$_PodcastsStateFromJson(Map<String, dynamic> json) {
  return _$_PodcastsState(
    searchPodcasts: (json['searchPodcasts'] as List)
        ?.map((e) => e == null
            ? null
            : SearchContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    podcast: json['podcast'] == null
        ? null
        : PodcastModel.fromJson(json['podcast'] as Map<String, dynamic>),
    podcastResult: json['podcastResult'] == null
        ? null
        : PodcastResultModel.fromJson(
            json['podcastResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PodcastsStateToJson(_$_PodcastsState instance) =>
    <String, dynamic>{
      'searchPodcasts': instance.searchPodcasts,
      'podcast': instance.podcast,
      'podcastResult': instance.podcastResult,
    };

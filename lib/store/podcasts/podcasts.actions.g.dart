// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcasts.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPodcastsSuccessAction _$SearchPodcastsSuccessActionFromJson(
    Map<String, dynamic> json) {
  return SearchPodcastsSuccessAction(
    searchPodcasts: (json['searchPodcasts'] as List)
        ?.map((e) => e == null
            ? null
            : SearchContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchPodcastsSuccessActionToJson(
        SearchPodcastsSuccessAction instance) =>
    <String, dynamic>{
      'searchPodcasts': instance.searchPodcasts,
    };

GetPodcastAction _$GetPodcastActionFromJson(Map<String, dynamic> json) {
  return GetPodcastAction(
    podcastId: json['podcastId'] as String,
  );
}

Map<String, dynamic> _$GetPodcastActionToJson(GetPodcastAction instance) =>
    <String, dynamic>{
      'podcastId': instance.podcastId,
    };

GetPodcastSuccessAction _$GetPodcastSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetPodcastSuccessAction(
    podcast: json['podcast'] == null
        ? null
        : PodcastModel.fromJson(json['podcast'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetPodcastSuccessActionToJson(
        GetPodcastSuccessAction instance) =>
    <String, dynamic>{
      'podcast': instance.podcast,
    };

GetPodcastResultAction _$GetPodcastResultActionFromJson(
    Map<String, dynamic> json) {
  return GetPodcastResultAction(
    podcastId: json['podcastId'] as String,
  );
}

Map<String, dynamic> _$GetPodcastResultActionToJson(
        GetPodcastResultAction instance) =>
    <String, dynamic>{
      'podcastId': instance.podcastId,
    };

GetPodcastResultSuccessAction _$GetPodcastResultSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetPodcastResultSuccessAction(
    podcastResult: json['podcastResult'] == null
        ? null
        : PodcastResultModel.fromJson(
            json['podcastResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetPodcastResultSuccessActionToJson(
        GetPodcastResultSuccessAction instance) =>
    <String, dynamic>{
      'podcastResult': instance.podcastResult,
    };

UpdatePodcastResultAction _$UpdatePodcastResultActionFromJson(
    Map<String, dynamic> json) {
  return UpdatePodcastResultAction(
    podcastId: json['podcastId'] as String,
    podcastResult: json['podcastResult'] == null
        ? null
        : PodcastResultModel.fromJson(
            json['podcastResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdatePodcastResultActionToJson(
        UpdatePodcastResultAction instance) =>
    <String, dynamic>{
      'podcastId': instance.podcastId,
      'podcastResult': instance.podcastResult,
    };

UpdatePodcastResultSuccessAction _$UpdatePodcastResultSuccessActionFromJson(
    Map<String, dynamic> json) {
  return UpdatePodcastResultSuccessAction(
    podcastResult: json['podcastResult'] == null
        ? null
        : PodcastResultModel.fromJson(
            json['podcastResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdatePodcastResultSuccessActionToJson(
        UpdatePodcastResultSuccessAction instance) =>
    <String, dynamic>{
      'podcastResult': instance.podcastResult,
    };

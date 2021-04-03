import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/common/models/podcast_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcasts.types.freezed.dart';
part 'podcasts.types.g.dart';

@freezed
abstract class PodcastsState with _$PodcastsState {
  const factory PodcastsState(
      {@required List<SearchContentModel> searchPodcasts,
      PodcastModel podcast,
      PodcastResultModel podcastResult}) = _PodcastsState;

  factory PodcastsState.initialState() =>
      PodcastsState(searchPodcasts: [], podcast: null);

  factory PodcastsState.fromJson(Map<String, dynamic> json) =>
      _$PodcastsStateFromJson(json);
}

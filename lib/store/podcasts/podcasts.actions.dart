import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/common/models/podcast_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcasts.actions.g.dart';

// Get podcasts
class SearchPodcastsAction {}

class SearchPodcastsRequestAction {}

@JsonSerializable()
class SearchPodcastsSuccessAction {
  final List<SearchContentModel> searchPodcasts;

  SearchPodcastsSuccessAction({@required this.searchPodcasts});

  factory SearchPodcastsSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$SearchPodcastsSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$SearchPodcastsSuccessActionToJson(this);
}

class GetPodcastsFailureAction {}

// Get podcast
@JsonSerializable()
class GetPodcastAction {
  final String podcastId;

  GetPodcastAction({@required this.podcastId});

  factory GetPodcastAction.fromJson(Map<String, dynamic> json) =>
      _$GetPodcastActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPodcastActionToJson(this);
}

class GetPodcastRequestAction {}

@JsonSerializable()
class GetPodcastSuccessAction {
  final PodcastModel podcast;

  GetPodcastSuccessAction({@required this.podcast});

  factory GetPodcastSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetPodcastSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPodcastSuccessActionToJson(this);
}

class GetPodcastFailureAction {}

// Get podcast result
@JsonSerializable()
class GetPodcastResultAction {
  final String podcastId;

  GetPodcastResultAction({@required this.podcastId});

  factory GetPodcastResultAction.fromJson(Map<String, dynamic> json) =>
      _$GetPodcastResultActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPodcastResultActionToJson(this);
}

class GetPodcastResultRequestAction {}

@JsonSerializable()
class GetPodcastResultSuccessAction {
  final PodcastResultModel podcastResult;

  GetPodcastResultSuccessAction({@required this.podcastResult});

  factory GetPodcastResultSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetPodcastResultSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPodcastResultSuccessActionToJson(this);
}

class GetPodcastResultFailureAction {}

// Update podcast result
@JsonSerializable()
class UpdatePodcastResultAction {
  final String podcastId;
  final PodcastResultModel podcastResult;

  UpdatePodcastResultAction(
      {@required this.podcastId, @required this.podcastResult});

  factory UpdatePodcastResultAction.fromJson(Map<String, dynamic> json) =>
      _$UpdatePodcastResultActionFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePodcastResultActionToJson(this);
}

class UpdatePodcastResultRequestAction {}

@JsonSerializable()
class UpdatePodcastResultSuccessAction {
  final PodcastResultModel podcastResult;

  UpdatePodcastResultSuccessAction({@required this.podcastResult});

  factory UpdatePodcastResultSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePodcastResultSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdatePodcastResultSuccessActionToJson(this);
}

class UpdatePodcastResultFailureAction {}

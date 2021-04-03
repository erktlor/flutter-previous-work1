import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.types.dart';

PodcastsState podcastsReducer(PodcastsState state, action) {
  if (action is SearchPodcastsSuccessAction) {
    return state.copyWith(searchPodcasts: action.searchPodcasts);
  }

  if (action is GetPodcastRequestAction) {
    return state.copyWith(podcast: null);
  }

  if (action is GetPodcastSuccessAction) {
    return state.copyWith(podcast: action.podcast);
  }

  if (action is GetPodcastResultRequestAction) {
    return state.copyWith(podcastResult: null);
  }

  if (action is GetPodcastResultSuccessAction) {
    return state.copyWith(podcastResult: action.podcastResult);
  }

  if (action is UpdatePodcastResultSuccessAction) {
    return state.copyWith(podcastResult: action.podcastResult);
  }

  return state;
}

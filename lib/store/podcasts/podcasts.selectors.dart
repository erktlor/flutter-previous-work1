import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/common/models/podcast_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:flutter_web_app/store/store.dart';

List<SearchContentModel> searchPodcastsSelector(ApplicationState state) {
  return state.podcasts.searchPodcasts;
}

PodcastModel podcastSelector(ApplicationState state) {
  return state.podcasts.podcast;
}

PodcastResultModel podcastResultSelector(ApplicationState state) {
  return state.podcasts.podcastResult;
}

bool isUpdatingPodcastResultSelector(ApplicationState state) {
  return createLoadingSelector([UpdatePodcastResultAction])(state);
}

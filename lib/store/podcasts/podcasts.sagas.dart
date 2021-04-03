import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/common/models/podcast_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetPodcasts({SearchPodcastsAction action}) sync* {
  yield Try(() sync* {
    yield Put(SearchPodcastsRequestAction());

    final result = Result<Response>();

    yield Call(Api.searchContent, args: ['type=podcast'], result: result);

    List<SearchContentModel> searchPodcasts = result.value.data
        .map<SearchContentModel>(
            (jsonItem) => SearchContentModel.fromJson(jsonItem))
        .toList();

    yield Put(SearchPodcastsSuccessAction(searchPodcasts: searchPodcasts));
  }, Catch: (e, s) sync* {
    yield Put(GetPodcastsFailureAction());
  });
}

_handleGetPodcast({GetPodcastAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetPodcastRequestAction());

    final result = Result<Response>();

    yield Call(Api.getPodcast, args: [action.podcastId], result: result);

    PodcastModel podcast = PodcastModel.fromJson(result.value.data);

    yield Put(GetPodcastSuccessAction(podcast: podcast));
  }, Catch: (e, s) sync* {
    if (e is DioError) {
      if (e.response.statusCode == 403) {
        navigatorKey.currentState.pushReplacementNamed(Routes.dashboard);
        toast('Podcast is not available');
      }
    }

    yield Put(GetPodcastFailureAction());
  });
}

_handleGetPodcastResult({GetPodcastResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetPodcastResultRequestAction());

    final result = Result<Response>();

    yield Call(Api.getPodcastResult, args: [action.podcastId], result: result);

    PodcastResultModel podcastResult =
        PodcastResultModel.fromJson(result.value.data);

    yield Put(GetPodcastResultSuccessAction(podcastResult: podcastResult));
  }, Catch: (e, s) sync* {
    yield Put(GetPodcastResultFailureAction());
  });
}

_handleUpdatePodcastResult({UpdatePodcastResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdatePodcastResultRequestAction());

    toast('Saving...');

    final result = Result<Response>();

    yield Call(Api.updatePodcastResult,
        args: [action.podcastId, action.podcastResult.toJson()],
        result: result);

    PodcastResultModel podcastResult =
        PodcastResultModel.fromJson(result.value.data);

    yield Put(UpdatePodcastResultSuccessAction(podcastResult: podcastResult));

    toast('Saved');
  }, Catch: (e, s) sync* {
    yield Put(UpdatePodcastResultFailureAction());
  });
}

_watchGetPodcasts() sync* {
  yield TakeLeading(_handleGetPodcasts, pattern: SearchPodcastsAction);
}

_watchGetPodcast() sync* {
  yield TakeLeading(_handleGetPodcast, pattern: GetPodcastAction);
}

_watchGetPodcastResult() sync* {
  yield TakeLeading(_handleGetPodcastResult, pattern: GetPodcastResultAction);
}

_watchUpdatePodcastResult() sync* {
  yield TakeLeading(_handleUpdatePodcastResult,
      pattern: UpdatePodcastResultAction);
}

podcastsSaga() sync* {
  yield Fork(_watchGetPodcasts);
  yield Fork(_watchGetPodcast);
  yield Fork(_watchGetPodcastResult);
  yield Fork(_watchUpdatePodcastResult);
}

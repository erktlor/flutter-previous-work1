import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetDashboardVideos({GetDashboardVideosAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetDashboardVideosRequestAction());

    final result = Result<Response>();

    yield Call(Api.getDashboardVideos, result: result);

    List<DashboardVideoModel> videos = result.value.data
        .map<DashboardVideoModel>(
            (jsonItem) => DashboardVideoModel.fromJson(jsonItem))
        .toList();

    yield Put(GetDashboardVideosSuccessAction(videos: videos));
  }, Catch: (e, s) sync* {
    yield Put(GetDashboardVideosFailureAction());
  });
}

_watchGetDashboardVideos() sync* {
  yield TakeLeading(_handleGetDashboardVideos,
      pattern: GetDashboardVideosAction);
}

dashboardSaga() sync* {
  yield Fork(_watchGetDashboardVideos);
}

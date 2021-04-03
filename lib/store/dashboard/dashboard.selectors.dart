import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.actions.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/store.dart';

List<DashboardVideoModel> dashboardVideosSelector(ApplicationState state) {
  return state.dashboard.videos;
}

bool isFetchingVideosSelector(ApplicationState state) {
  return createLoadingSelector([GetDashboardVideosAction])(state);
}

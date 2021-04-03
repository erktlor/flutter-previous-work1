import 'package:flutter_web_app/store/dashboard/dashboard.actions.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.types.dart';

DashboardState dashboardReducer(DashboardState state, action) {
  if (action is GetDashboardVideosAction) {
    return state.copyWith(videos: []);
  }

  if (action is GetDashboardVideosSuccessAction) {
    return state.copyWith(videos: action.videos);
  }

  return state;
}

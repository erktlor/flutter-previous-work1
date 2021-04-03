import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';

class GetDashboardVideosAction {}

class GetDashboardVideosRequestAction {}

class GetDashboardVideosSuccessAction {
  final List<DashboardVideoModel> videos;

  GetDashboardVideosSuccessAction({@required this.videos});
}

class GetDashboardVideosFailureAction {}

import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/dashboard/dashboard_content/dashboard_content.desktop.dart';
import 'package:flutter_web_app/widgets/dashboard/dashboard_content/dashboard_content.mobile.dart';

class DashboardContent extends StatelessWidget {
  final List<DashboardVideoModel> videos;
  final bool loading;

  DashboardContent({@required this.videos, @required this.loading});

  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);

    return mobile
        ? DashboardContentMobile(videos: videos, loading: loading)
        : DashboardContentDesktop(videos: videos, loading: loading);
  }
}

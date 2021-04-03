import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.actions.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/dashboard/dashboard_content/dashboard_content.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, DashboardProps>(
        converter: DashboardProps.fromStore,
        distinct: true,
        onInitialBuild: (props) {
          props.getDashboardVideos();
        },
        builder: (context, props) {
          return Scaffold(
            body: PageLayout(
              header: AuthorizedHeader(),
              child: DashboardContent(
                loading: props.isFetchingVideos,
                videos: props.videos,
              ),
            ),
          );
        });
  }
}

class DashboardProps extends Equatable {
  final List<DashboardVideoModel> videos;
  final bool isFetchingVideos;
  final VoidCallback getDashboardVideos;

  DashboardProps(
      {@required this.videos,
      @required this.isFetchingVideos,
      @required this.getDashboardVideos});

  static DashboardProps fromStore(Store<ApplicationState> store) {
    return DashboardProps(
        videos: dashboardVideosSelector(store.state),
        isFetchingVideos: isFetchingVideosSelector(store.state),
        getDashboardVideos: () {
          store.dispatch(GetDashboardVideosAction());
        });
  }

  @override
  List<Object> get props => [videos, isFetchingVideos];
}

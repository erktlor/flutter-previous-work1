import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_content/podcast_content.dart';
import 'package:redux/redux.dart';

class Podcast extends StatelessWidget {
  final String podcastId;

  Podcast({@required this.podcastId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PodcastProps>(
        onInitialBuild: (props) {
          props.getPodcast(podcastId);
          props.getPodcastResult(podcastId);
        },
        builder: (context, props) {
          return Scaffold(
            body: PageLayout(
              header: AuthorizedHeader(),
              child: props.podcast != null
                  ? PodcastContent(podcast: props.podcast)
                  : const LinearProgressIndicator(),
            ),
          );
        },
        converter: _PodcastProps.fromStore);
  }
}

class _PodcastProps extends Equatable {
  final PodcastModel podcast;
  final Function(String) getPodcast;
  final Function(String) getPodcastResult;

  _PodcastProps(
      {@required this.podcast,
      @required this.getPodcast,
      @required this.getPodcastResult});

  static _PodcastProps fromStore(Store<ApplicationState> store) {
    return _PodcastProps(
        podcast: podcastSelector(store.state),
        getPodcast: (String podcastId) {
          store.dispatch(GetPodcastAction(podcastId: podcastId));
        },
        getPodcastResult: (String podcastId) {
          store.dispatch(GetPodcastResultAction(podcastId: podcastId));
        });
  }

  @override
  List<Object> get props => [podcast];
}

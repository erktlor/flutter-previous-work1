import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/common/models/podcast_result.model.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:flutter_web_app/widgets/favourite_page_header/favourite_page_header.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_page/podcast_audios.dart';
import 'package:flutter_web_app/widgets/save_text_block/save_text_block.dart';
import 'package:redux/redux.dart';

class PodcastPage extends StatelessWidget {
  final PodcastModel podcast;

  PodcastPage({@required this.podcast});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PodcastPageProps>(
      builder: (context, props) {
        final favourite = props.podcastResult?.favourite ?? false;
        final notes = props.podcastResult?.notes ?? '';
        final watched = props.podcastResult?.watched ?? false;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FavouritePageHeader(
                  title: podcast.name,
                  date: DateTime.parse(podcast.publishedAt),
                  presenters: podcast.presenters,
                  subjects: [],
                  favourite: favourite,
                  onFavouriteChange: (bool value) {
                    if (props.podcastResult != null) {
                      props.updatePodcastResult(podcast.id,
                          props.podcastResult.copyWith(favourite: value));
                    }
                  }),
              const SizedBox(height: 30),
              PodcastAudios(podcast: podcast),
              const SizedBox(height: 30),
              CustomCheckbox(
                  value: watched,
                  onChange: (bool value) {
                    if (props.podcastResult != null) {
                      props.updatePodcastResult(podcast.id,
                          props.podcastResult.copyWith(watched: !watched));
                    }
                  },
                  label: watched
                      ? 'Content viewed.'
                      : 'Tick this box if you have read/watched this content'),
              const SizedBox(height: 10),
              SaveTextBlock(
                  saving: props.isUpdatingPodcastResult,
                  value: notes,
                  onSave: (String value) {
                    if (props.podcastResult != null) {
                      props.updatePodcastResult(podcast.id,
                          props.podcastResult.copyWith(notes: value));
                    }
                  },
                  title: 'Notes',
                  placeholder: 'Write your notes here')
            ],
          ),
        );
      },
      converter: _PodcastPageProps.fromStore,
      distinct: true,
    );
  }
}

class _PodcastPageProps extends Equatable {
  final PodcastResultModel podcastResult;
  final Function(String, PodcastResultModel) updatePodcastResult;
  final bool isUpdatingPodcastResult;

  _PodcastPageProps(
      {@required this.podcastResult,
      @required this.updatePodcastResult,
      @required this.isUpdatingPodcastResult});

  static _PodcastPageProps fromStore(Store<ApplicationState> store) {
    return _PodcastPageProps(
        podcastResult: podcastResultSelector(store.state),
        updatePodcastResult:
            (String podcastId, PodcastResultModel podcastResult) {
          store.dispatch(UpdatePodcastResultAction(
              podcastId: podcastId, podcastResult: podcastResult));
        },
        isUpdatingPodcastResult: isUpdatingPodcastResultSelector(store.state));
  }

  @override
  List<Object> get props => [podcastResult, isUpdatingPodcastResult];
}

import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.actions.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:redux/redux.dart';
import 'package:video_player/video_player.dart';

class SmartVideoComponent extends StatefulWidget {
  final String videoUri;

  SmartVideoComponent({@required this.videoUri});

  @override
  _SmartVideoComponentState createState() => _SmartVideoComponentState();
}

class _SmartVideoComponentState extends State<SmartVideoComponent> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Timer timer;

  get isPlayerInitialized =>
      chewieController != null &&
      chewieController.videoPlayerController.value.initialized;

  initializePlayer(int seconds) async {
    videoPlayerController = VideoPlayerController.network(widget.videoUri);

    await videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: true,
        startAt: Duration(seconds: seconds),
        aspectRatio: videoPlayerController.value.aspectRatio,
        showControlsOnInitialize: false,
        allowPlaybackSpeedChanging: false);

    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _SmartVideoComponentProps>(
      onInitialBuild: (props) {
        if (props.progresses[widget.videoUri] != null) {
          initializePlayer(props.progresses[widget.videoUri]);
        } else {
          props.getContentProgress(widget.videoUri);
        }

        timer = Timer.periodic(const Duration(seconds: 5), (timer) {
          if (isPlayerInitialized && chewieController.isPlaying) {
            props.updateContentProgressAction(
                widget.videoUri,
                chewieController
                    .videoPlayerController.value.position.inSeconds);
          }
        });
      },
      onWillChange: (oldProps, newProps) {
        if (oldProps.progresses[widget.videoUri] == null &&
            newProps.progresses[widget.videoUri] != null) {
          initializePlayer(newProps.progresses[widget.videoUri]);
        }
      },
      builder: (context, props) {
        return LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = width / (16 / 9);

          return Container(
            width: width,
            height: height,
            child: isPlayerInitialized
                ? Chewie(
                    controller: chewieController,
                  )
                : const Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator())),
          );
        });
      },
      converter: _SmartVideoComponentProps.fromStore,
      distinct: true,
    );
  }
}

class _SmartVideoComponentProps extends Equatable {
  final Function(String) getContentProgress;
  final Function(String, int) updateContentProgressAction;
  final Map<String, int> progresses;

  _SmartVideoComponentProps(
      {@required this.getContentProgress,
      @required this.updateContentProgressAction,
      @required this.progresses});

  static _SmartVideoComponentProps fromStore(Store<ApplicationState> store) {
    return _SmartVideoComponentProps(
        getContentProgress: (String contentUri) {
          store.dispatch(GetContentProgressAction(contentUri: contentUri));
        },
        updateContentProgressAction: (String contentUri, int seconds) {
          store.dispatch(UpdateContentProgressAction(
              contentUri: contentUri, seconds: seconds));
        },
        progresses: contentProgressesSelector(store.state));
  }

  @override
  List<Object> get props => [progresses];
}

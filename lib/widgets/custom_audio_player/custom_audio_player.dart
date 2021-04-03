import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.actions.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:redux/redux.dart';

typedef void OnError(Exception exception);

enum PlayerState { stopped, playing, paused }

class CustomAudioPlayer extends StatefulWidget {
  final String audioUri;
  final String title;
  final String featuredImageUri;

  CustomAudioPlayer({
    Key key,
    @required this.audioUri,
    @required this.title,
    this.featuredImageUri,
  }) : super(key: key);

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer;
  PlayerState playerState = PlayerState.stopped;
  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerProcessingStateSubscription;
  StreamSubscription _audioPlayerPlayingSubscription;
  Timer timer;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _audioPlayerProcessingStateSubscription?.cancel();
    _audioPlayerPlayingSubscription?.cancel();
    audioPlayer.stop();

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void initAudioPlayer(int seconds) async {
    audioPlayer = AudioPlayer();

    final audioDuration = await audioPlayer.setUrl(widget.audioUri);

    audioPlayer.seek(Duration(seconds: seconds.toInt()));

    setState(() {
      duration = audioDuration;
    });

    _audioPlayerPlayingSubscription =
        audioPlayer.playingStream.listen((playing) {
      setState(() {
        playerState = playing ? PlayerState.playing : PlayerState.paused;
      });
    });

    _audioPlayerProcessingStateSubscription =
        audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        stop();
      }
    });

    _positionSubscription = audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  Future play() async {
    audioPlayer.play();

    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future pause() async {
    await audioPlayer.pause();

    setState(() {
      playerState = PlayerState.paused;
    });
  }

  Future stop() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration(seconds: 0));

    setState(() {
      playerState = PlayerState.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      onInitialBuild: (props) {
        if (props.progresses[widget.audioUri] != null) {
          initAudioPlayer(props.progresses[widget.audioUri]);
        } else {
          props.getContentProgress(widget.audioUri);
        }

        timer = Timer.periodic(const Duration(seconds: 5), (timer) {
          if (isPlaying) {
            props.updateContentProgressAction(
                widget.audioUri, position.inSeconds);
          }
        });
      },
      onWillChange: (oldProps, newProps) {
        if (oldProps.progresses[widget.audioUri] == null &&
            newProps.progresses[widget.audioUri] != null) {
          initAudioPlayer(newProps.progresses[widget.audioUri]);
        }
      },
      builder: (context, props) {
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.gray2,
              border: Border.all(color: AppColors.gray13, width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPlayer(),
            ],
          ),
        );
      },
      converter: _CustomAudioPlayerProps.fromStore,
      distinct: true,
    );
  }

  Widget _buildPlayer() {
    bool mobile = isMobile(context);

    return Container(
      padding: EdgeInsets.all(mobile ? 4.0 : 16.0),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildImage(),
                const SizedBox(height: 20),
                buildControls(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImage(),
                const SizedBox(width: 20),
                Flexible(
                  child: buildControls(),
                ),
              ],
            ),
    );
  }

  buildImage() {
    if (widget.featuredImageUri == null) {
      return SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(right: 0),
      width: 144,
      height: 144,
      child: Image(
        image: NetworkImage(widget.featuredImageUri),
        fit: BoxFit.cover,
        alignment: Alignment.centerRight,
      ),
    );
  }

  buildControls() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.green0,
                    borderRadius: BorderRadius.circular(25)),
                child: !isPlaying
                    ? IconButton(
                        onPressed: isPlaying ? null : () => play(),
                        iconSize: 32.0,
                        icon: Icon(
                          Icons.play_arrow,
                          color: AppColors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: isPlaying ? () => pause() : null,
                        iconSize: 32.0,
                        icon: Icon(
                          Icons.pause,
                          color: AppColors.white,
                        )),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
              )
            ]),
        Slider(
            activeColor: AppColors.green0,
            value: position?.inSeconds?.toDouble() ?? 0.0,
            onChanged: (double value) {
              audioPlayer.seek(Duration(seconds: value.toInt()));
            },
            min: 0.0,
            max: duration != null
                ? duration.inSeconds.toDouble()
                : double.infinity),
        Container(
            margin: EdgeInsets.only(left: 25), child: _buildProgressView())
      ],
    );
  }

  Widget _buildProgressView() {
    return Text(
      position != null
          ? "${positionText ?? ''} / ${durationText ?? ''}"
          : duration != null
              ? durationText
              : '',
      style: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w300),
    );
  }
}

class _CustomAudioPlayerProps extends Equatable {
  final Function(String) getContentProgress;
  final Function(String, int) updateContentProgressAction;
  final Map<String, int> progresses;

  _CustomAudioPlayerProps(
      {@required this.getContentProgress,
      @required this.updateContentProgressAction,
      @required this.progresses});

  static _CustomAudioPlayerProps fromStore(Store<ApplicationState> store) {
    return _CustomAudioPlayerProps(
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

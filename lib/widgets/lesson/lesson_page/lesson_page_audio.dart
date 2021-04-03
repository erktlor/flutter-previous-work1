import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/widgets/custom_audio_player/custom_audio_player.dart';

class LessonPageAudio extends StatelessWidget {
  final LessonModel lesson;

  LessonPageAudio({@required this.lesson});

  @override
  Widget build(BuildContext context) {
    return CustomAudioPlayer(
      audioUri: lesson.audioUri,
      title: lesson.name,
      featuredImageUri: '',
    );
  }
}

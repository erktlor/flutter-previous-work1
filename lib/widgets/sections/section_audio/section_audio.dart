import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/section_data_audio.model.dart';
import 'package:flutter_web_app/widgets/custom_audio_player/custom_audio_player.dart';

class SectionAudio extends StatefulWidget {
  final SectionDataAudioModel data;
  final String title;
  final String featuredImageUri;

  SectionAudio(
      {@required this.data,
      @required this.title,
      @required this.featuredImageUri});

  @override
  _SectionAudioState createState() => _SectionAudioState();
}

class _SectionAudioState extends State<SectionAudio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomAudioPlayer(
        audioUri: widget.data.audioUri,
        title: widget.title,
        featuredImageUri: widget.featuredImageUri,
      ),
    );
  }
}

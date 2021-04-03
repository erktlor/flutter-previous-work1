import 'package:flutter/cupertino.dart';

class SectionDataAudioModel {
  final String audioUri;

  SectionDataAudioModel({@required this.audioUri});

  static SectionDataAudioModel fromJson(jsonData) {
    return SectionDataAudioModel(audioUri: jsonData['audioUri']);
  }
}

import 'package:flutter/cupertino.dart';

class SectionDataVideoModel {
  final String videoUri;

  SectionDataVideoModel({@required this.videoUri});

  static SectionDataVideoModel fromJson(jsonData) {
    return SectionDataVideoModel(videoUri: jsonData['videoUri']);
  }
}

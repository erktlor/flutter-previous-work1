import 'package:flutter/foundation.dart';

class SectionDataTextModel {
  final String text;

  SectionDataTextModel({@required this.text});

  static SectionDataTextModel fromJson(jsonData) {
    return SectionDataTextModel(text: jsonData['text']);
  }
}

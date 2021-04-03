import 'package:flutter/foundation.dart';

class DownloadsFileModel {
  final String title;
  final String description;
  final String link;
  final String fileUri;

  DownloadsFileModel(
      {@required this.title,
      @required this.description,
      @required this.link,
      @required this.fileUri});

  static DownloadsFileModel fromJson(jsonData) {
    return DownloadsFileModel(
        title: jsonData['title'],
        description: jsonData['description'],
        link: jsonData['link'],
        fileUri: jsonData['fileUri']);
  }
}

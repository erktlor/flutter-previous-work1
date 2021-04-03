import 'package:flutter/foundation.dart';

import 'downloads_file.model.dart';

class SectionDataDownloadsModel {
  final List<DownloadsFileModel> files;

  SectionDataDownloadsModel({@required this.files});

  static SectionDataDownloadsModel fromJson(jsonData) {
    List<DownloadsFileModel> files = jsonData['files']
        .map<DownloadsFileModel>(
            (jsonFile) => DownloadsFileModel.fromJson(jsonFile))
        .toList();

    return SectionDataDownloadsModel(files: files);
  }
}

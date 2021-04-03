import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/section_types.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/section.model.dart';
import 'package:flutter_web_app/common/models/section_data_audio.model.dart';
import 'package:flutter_web_app/common/models/section_data_downloads.model.dart';
import 'package:flutter_web_app/common/models/section_data_text.model.dart';
import 'package:flutter_web_app/common/models/section_data_video.model.dart';
import 'package:flutter_web_app/widgets/sections/section_audio/section_audio.dart';
import 'package:flutter_web_app/widgets/sections/section_downloads/section_downloads.dart';
import 'package:flutter_web_app/widgets/sections/section_text/section_text.dart';
import 'package:flutter_web_app/widgets/sections/section_video/section_video.dart';

class InterviewPageSections extends StatelessWidget {
  final InterviewModel interview;

  InterviewPageSections({@required this.interview});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final section in interview.sections)
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: buildSection(section))
        ],
      ),
    );
  }

  Widget buildSection(SectionModel section) {
    switch (section.type) {
      case SectionTypes.text:
        return SectionText(
            data: SectionDataTextModel.fromJson(jsonDecode(section.data)));
      case SectionTypes.audio:
        return SectionAudio(
            title: interview.name,
            featuredImageUri: interview.featuredImageUri,
            data: SectionDataAudioModel.fromJson(jsonDecode(section.data)));
      case SectionTypes.downloads:
        return SectionDownloads(
          data: SectionDataDownloadsModel.fromJson(jsonDecode(section.data)),
        );
      case SectionTypes.video:
        return SectionVideo(
          data: SectionDataVideoModel.fromJson(jsonDecode(section.data)),
        );
    }

    return SizedBox.shrink();
  }
}

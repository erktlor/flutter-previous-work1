import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_content/podcast_content.desktop.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_content/podcast_content.mobile.dart';

class PodcastContent extends StatelessWidget {
  final PodcastModel podcast;

  PodcastContent({@required this.podcast});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? PodcastContentMobile(podcast: podcast)
        : PodcastContentDesktop(
            podcast: podcast,
          );
  }
}

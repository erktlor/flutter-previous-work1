import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_page/podcast_page.dart';

class PodcastContentMobile extends StatelessWidget {
  final PodcastModel podcast;

  PodcastContentMobile({@required this.podcast});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: PodcastPage(
              podcast: podcast,
            ),
          ),
        ],
      ),
    );
  }
}

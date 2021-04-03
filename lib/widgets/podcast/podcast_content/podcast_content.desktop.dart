import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/podcast/podcast_page/podcast_page.dart';

class PodcastContentDesktop extends StatelessWidget {
  final PodcastModel podcast;

  PodcastContentDesktop({@required this.podcast});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: PodcastPage(
              podcast: podcast,
            ),
          )),
          NavigationBar(),
        ],
      ),
    );
  }
}

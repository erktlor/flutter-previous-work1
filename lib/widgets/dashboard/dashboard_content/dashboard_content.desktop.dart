import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/utils/split_by_chunks.dart';
import 'package:flutter_web_app/widgets/dashboard/dashboard_content/dashboard_video_item.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardContentDesktop extends StatelessWidget {
  final List<DashboardVideoModel> videos;
  final bool loading;

  DashboardContentDesktop({@required this.videos, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: AppColors.gray11, width: 1))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray3),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (loading) const LinearProgressIndicator(),
                  buildGrid(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildGrid(context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var crossAxisCount = 3;

    if (screenWidth < 1200) {
      crossAxisCount = 2;
    }

    final chunks = splitByChunks(videos, crossAxisCount);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final chunk in chunks)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (final video in chunk)
                  Flexible(
                      flex: 1,
                      child: Container(
                          margin: chunk.indexOf(video) != chunk.length - 1
                              ? const EdgeInsets.only(right: 20)
                              : EdgeInsets.zero,
                          child: DashboardVideoItem(video: video)))
              ],
            ),
          )
      ],
    );
  }
}

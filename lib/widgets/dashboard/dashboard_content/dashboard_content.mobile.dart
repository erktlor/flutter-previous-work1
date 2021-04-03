import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/widgets/dashboard/dashboard_content/dashboard_video_item.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardContentMobile extends StatelessWidget {
  final List<DashboardVideoModel> videos;
  final bool loading;

  DashboardContentMobile({@required this.videos, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Welcome!',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray3),
            ),
          ),
          if (loading) const LinearProgressIndicator(),
          buildList()
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shrinkWrap: true,
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        return DashboardVideoItem(video: videos.elementAt(index));
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: 50,
      ),
    );
  }
}

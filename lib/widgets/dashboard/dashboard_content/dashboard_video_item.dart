import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:flutter_web_app/widgets/smart_video_component/smart_video_component.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardVideoItem extends StatefulWidget {
  final DashboardVideoModel video;

  DashboardVideoItem({@required this.video});

  @override
  _DashboardVideoItemState createState() => _DashboardVideoItemState();
}

class _DashboardVideoItemState extends State<DashboardVideoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [buildVideo(), const SizedBox(height: 20), buildTitle()],
      ),
    );
  }

  buildVideo() {
    return SmartVideoComponent(
      videoUri: widget.video.videoUri,
    );
  }

  buildTitle() {
    return Text(
      widget.video.name,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.gray3),
    );
  }
}

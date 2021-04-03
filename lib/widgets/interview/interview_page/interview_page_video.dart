import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/utils/get_duration_string_from_seconds.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_web_app/widgets/presenters_and_subjects_info/presenters_and_subjects_info.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:flutter_web_app/widgets/smart_video_component/smart_video_component.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewPageVideo extends StatelessWidget {
  final InterviewModel interview;
  final VoidCallback onFavouriteTap;
  final bool favourite;

  InterviewPageVideo(
      {@required this.interview,
      @required this.onFavouriteTap,
      @required this.favourite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SmartVideoComponent(videoUri: interview.videoUri),
        const SizedBox(height: 20),
        buildVideoBottom(),
      ],
    );
  }

  Widget buildVideoBottom() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10), child: buildInformation()),
        SizedBox(
          width: 150,
          child: SelectedButton(
            selected: favourite,
            text: 'FAVOURITE',
            onPressed: onFavouriteTap,
            icon: favourite
                ? MaterialCommunityIcons.heart
                : MaterialCommunityIcons.heart_outline,
          ),
        ),
      ],
    );
  }

  Widget buildInformation() {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildTitle(), const SizedBox(height: 5), buildVideoInfo()],
        )
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      interview.name,
      style: GoogleFonts.poppins(
          height: 1.45,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.gray3),
    );
  }

  Widget buildVideoInfo() {
    TextStyle textStyle = GoogleFonts.poppins(
        height: 1.64,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.gray3);

    return Wrap(
      children: [
        Text('Duration: ${getDurationStringFromSeconds(interview.duration)}',
            style: textStyle),
        const SizedBox(width: 5),
        Text(
          DateTime.parse(interview.publishedAt).format('MMMM dd, yyyy'),
          style: textStyle,
        ),
        const SizedBox(width: 5),
        PresentersAndSubjectsInfo(
            presenters: interview.presenters,
            subjects: interview.subjects,
            titleStyle: GoogleFonts.poppins(
                height: 1.64,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.gray3),
            itemStyle: GoogleFonts.poppins(
                height: 1.64,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.gray3))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/widgets/presenters_and_subjects_info/presenters_and_subjects_info.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';

class FavouritePageHeader extends StatelessWidget {
  final String title;
  final DateTime date;
  final List<PresenterModel> presenters;
  final List<SubjectModel> subjects;
  final bool favourite;
  final Function(bool) onFavouriteChange;

  FavouritePageHeader(
      {@required this.title,
      @required this.date,
      @required this.presenters,
      @required this.subjects,
      @required this.favourite,
      @required this.onFavouriteChange});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool showAsMobile = screenWidth < 1200;

    return Container(
        child: Flex(
      direction: showAsMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray3),
                  ),
                ),
              ),
              buildInformation()
            ],
          ),
        ),
        const SizedBox(height: 10, width: 10),
        Row(
          children: [
            SelectedButton(
              selected: favourite,
              text: 'FAVOURITE',
              onPressed: () => onFavouriteChange(!favourite),
              icon: favourite
                  ? MaterialCommunityIcons.heart
                  : MaterialCommunityIcons.heart_outline,
            ),
          ],
        )
      ],
    ));
  }

  buildInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(date.format('MMMM dd, yyyy'),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.8,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3)),
            const SizedBox(
              width: 5,
            ),
            PresentersAndSubjectsInfo(
                presenters: presenters,
                subjects: subjects,
                titleStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3),
                itemStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3))
          ],
        ),
      ],
    );
  }
}

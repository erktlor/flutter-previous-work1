import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/get_duration_string_from_seconds.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/presenters_and_subjects_info/presenters_and_subjects_info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';
import 'package:strings/strings.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SearchListItem extends StatelessWidget {
  final SearchContentModel searchContent;

  SearchListItem({@required this.searchContent});

  onTap() {
    String path;

    if (searchContent.type == 'interview') {
      path = Routes.interview + '?' + searchContent.parameters;
    } else if (searchContent.type == 'course') {
      path = Routes.course + '?' + searchContent.parameters;
    } else if (searchContent.type == 'podcast') {
      path = Routes.podcast + '?' + searchContent.parameters;
    } else if (searchContent.type == 'lesson') {
      path = Routes.lesson + '?' + searchContent.parameters;
    }

    if (path != null) {
      navigatorKey.currentState.pushReplacementNamed(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Stack(
      children: [
        Container(
          child: mobile
              ? (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildImage(context),
                    const SizedBox(height: 10),
                    buildInformation()
                  ],
                ))
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: buildImage(context),
                      flex: 3,
                    ),
                    const SizedBox(width: 10),
                    Flexible(child: buildInformation(), flex: 4)
                  ],
                ),
        ),
        if (searchContent.watched)
          Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.green1,
                child: Center(
                    child: Row(
                  children: [
                    Icon(Icons.check, color: AppColors.white, size: 18),
                    const SizedBox(width: 5),
                    Text('CONTENT VIEWED',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white)),
                  ],
                )),
              ))
      ],
    );
  }

  buildImage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool mobile = isMobile(context);

    var width = mobile ? double.infinity : screenSize.width / 2;

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            Container(
              width: width,
              color: AppColors.black,
              child: AspectRatio(
                aspectRatio: 1.59,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(searchContent.imageUri ?? ''),
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: AppColors.gray23,
                      child: Center(
                        child: Text(
                          capitalize(searchContent.type),
                          style: GoogleFonts.poppins(
                              fontSize: 29,
                              fontWeight: FontWeight.w700,
                              color: AppColors.gray3),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (searchContent.favourite)
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 36,
                    color: AppColors.green0,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Icon(
                        MaterialCommunityIcons.heart,
                        color: AppColors.black,
                      ),
                    ),
                  )),
            if (searchContent.duration != null)
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: AppColors.black,
                  child: Text(
                    getDurationStringFromSeconds(searchContent.duration),
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  buildInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              searchContent.name,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray3),
            ),
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
                DateTime.parse(searchContent.publishedAt)
                    .format('MMMM dd, yyyy'),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray12)),
            const SizedBox(
              width: 5,
            ),
            PresentersAndSubjectsInfo(
                presenters: searchContent.presenters,
                subjects: searchContent.subjects,
                titleStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray12),
                itemStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray3)),
          ],
        ),
        const SizedBox(height: 30),
        HtmlWidget(
          searchContent.description,
          onTapUrl: (url) {
            openLink(url);
          },
          textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.gray3),
        ),
      ],
    );
  }
}

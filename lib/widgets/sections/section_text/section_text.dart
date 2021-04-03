import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/section_data_text.model.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionText extends StatelessWidget {
  final SectionDataTextModel data;

  SectionText({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HtmlWidget(
        data.text,
        onTapUrl: (url) {
          openLink(url);
        },
        textStyle: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.gray3),
      ),
    );
  }
}

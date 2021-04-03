import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  FormHeader({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildTitle(), const SizedBox(height: 10), buildSubtitle()],
      ),
    );
  }

  buildTitle() {
    return Text(title,
        style: GoogleFonts.poppins(
            fontSize: 34, fontWeight: FontWeight.w700, color: AppColors.white));
  }

  buildSubtitle() {
    return Text(subtitle,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white));
  }
}

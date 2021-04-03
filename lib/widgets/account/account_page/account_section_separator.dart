import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSectionSeparator extends StatelessWidget {
  final String text;

  AccountSectionSeparator({@required this.text});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColors.gray24))),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: mobile ? 16 : 24,
            fontWeight: FontWeight.w700,
            color: AppColors.gray3),
      ),
    );
  }
}

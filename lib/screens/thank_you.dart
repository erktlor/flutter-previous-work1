import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';
import 'package:flutter_web_app/widgets/header/not_authorized_header/not_authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final mobile = isMobile(context);

    return Scaffold(
      body: PageLayout(
        header: NotAuthorizedHeader(
          color: HeaderDesktopLinkColor.dark,
        ),
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.1),
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 100),
          child: Center(
            child: Text(
              'Thanks for registering your interest! You will be notified as soon as spots are available.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: mobile ? 20 : 40,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray3),
            ),
          ),
        ),
      ),
    );
  }
}

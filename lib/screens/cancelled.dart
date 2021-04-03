import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';
import 'package:flutter_web_app/widgets/header/not_authorized_header/not_authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class Cancelled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final mobile = isMobile(context);

    final defaultStyle = GoogleFonts.poppins(
        fontSize: mobile ? 20 : 40,
        fontWeight: FontWeight.w700,
        color: AppColors.gray3);

    final linkStyle = GoogleFonts.poppins(
        fontSize: mobile ? 20 : 40,
        fontWeight: FontWeight.w700,
        color: AppColors.blue0);

    return Scaffold(
      body: PageLayout(
        header: NotAuthorizedHeader(
          color: HeaderDesktopLinkColor.dark,
        ),
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.1),
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 100),
          child: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(style: defaultStyle, children: [
                  TextSpan(text: 'Sorry your account has been canceled.\n'),
                  TextSpan(
                      text: 'Contact',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          openLink('mailto:support@tompanos.com.au');
                        }),
                  TextSpan(text: ' support if you have any questions')
                ])),
          ),
        ),
      ),
    );
  }
}

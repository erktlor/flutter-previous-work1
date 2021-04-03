import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  onPrivacyPagePress() {
    openLink('https://www.realestategym.com.au/privacy-policy');
  }

  onContactPagePress() {
    openLink('https://www.realestategym.com.au/contact');
  }

  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: AppColors.gray3,
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLogo(),
                const SizedBox(height: 15),
                buildCopyright(),
                const SizedBox(height: 10),
                buildLink(
                    'Privacy Policy, Terms & Conditions', onPrivacyPagePress),
                const SizedBox(height: 10),
                buildLink('Contact', onContactPagePress)
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLogo(),
                const SizedBox(width: 10),
                buildCopyright(),
                const Spacer(),
                buildLink(
                    'Privacy Policy, Terms & Conditions', onPrivacyPagePress),
                Container(width: 1, height: 15, color: AppColors.white),
                buildLink('Contact', onContactPagePress),
              ],
            ),
    );
  }

  buildLogo() {
    return Container(
        width: 90,
        height: 22,
        child:
            Image(fit: BoxFit.contain, image: NetworkImage(Images.footerLogo)));
  }

  buildCopyright() {
    final year = DateTime.now().year;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
          'Copyright $year - Tom Panos | Real Estate Gym - All Rights Reserved.',
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.white)),
    );
  }

  buildLink(String text, VoidCallback onPressed) {
    return TextButton(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.white),
          )),
      onPressed: onPressed,
    );
  }
}

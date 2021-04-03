import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget iconPrepend;
  final Widget iconAppend;

  CustomActionButton(
      {@required this.text, this.onTap, this.iconPrepend, this.iconAppend});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: AppColors.black,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: mobile ? 34 : 39,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 25,
                  child: Center(
                    child: iconPrepend ?? SizedBox.shrink(),
                  ),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      fontSize: mobile ? 10.5 : 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white),
                ),
                Container(
                  width: 25,
                  child: Center(
                    child: iconAppend ?? SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

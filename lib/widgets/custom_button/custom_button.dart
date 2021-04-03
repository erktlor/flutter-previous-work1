import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String text;

  CustomButton({@required this.onPressed, this.child, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        color: AppColors.green0,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 52),
        child: buildChild(context),
      ),
    );
  }

  buildChild(context) {
    var mobile = isMobile(context);

    if (text != null) {
      return Text(text,
          style: GoogleFonts.poppins(
              fontSize: mobile ? 16 : 18,
              color: AppColors.black,
              height: 1.5,
              fontWeight: FontWeight.w500));
    }

    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum HeaderDesktopLinkColor { light, dark }

class HeaderDesktopLink extends StatelessWidget {
  final String text;
  final bool active;
  final VoidCallback onPressed;
  final HeaderDesktopLinkColor color;
  final Icon icon;

  HeaderDesktopLink(
      {@required this.text,
      @required this.active,
      @required this.onPressed,
      this.icon,
      this.color = HeaderDesktopLinkColor.dark});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  color: color == HeaderDesktopLinkColor.dark
                      ? AppColors.black
                      : AppColors.white),
            ),
            if (icon != null) icon
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}

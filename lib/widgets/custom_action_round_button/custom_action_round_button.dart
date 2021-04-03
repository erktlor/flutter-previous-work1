import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomActionRoundButton extends StatelessWidget {
  final Widget child;
  final String label;
  final VoidCallback onTap;

  CustomActionRoundButton(
      {@required this.child, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.black),
                child: Center(
                  child: child,
                )),
            const SizedBox(width: 6),
            Flexible(
              child: Text(label,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w800)),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final String text;
  final Color color;

  Label({@required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
          color: color ?? AppColors.gray3,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.white),
        ),
      ),
    );
  }
}

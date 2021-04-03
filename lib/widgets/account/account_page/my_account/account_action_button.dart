import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  AccountActionButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      color: AppColors.green0,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

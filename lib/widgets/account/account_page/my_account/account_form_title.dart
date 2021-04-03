import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountFormTitle extends StatelessWidget {
  final String text;

  AccountFormTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: mobile ? 14 : 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}

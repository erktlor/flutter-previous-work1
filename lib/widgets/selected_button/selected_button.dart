import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final bool disabled;

  SelectedButton({
    @required this.selected,
    @required this.onPressed,
    this.text,
    this.icon,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: FlatButton(
        onPressed: onPressed,
        color: disabled
            ? AppColors.gray17
            : selected
                ? AppColors.green0
                : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Icon(icon,
                        color: selected ? AppColors.black : AppColors.gray3)),
              if (text != null)
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: selected ? AppColors.black : AppColors.gray3),
                )
            ],
          ),
        ),
      ),
    );
  }
}

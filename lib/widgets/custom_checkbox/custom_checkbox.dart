import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;
  final dynamic label;
  final Color activeCheckboxBackgroundColor;

  CustomCheckbox(
      {@required this.value,
      @required this.label,
      this.onChange,
      this.activeCheckboxBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(!value),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          child: IgnorePointer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: value
                          ? activeCheckboxBackgroundColor ?? AppColors.green0
                          : AppColors.gray14,
                      borderRadius: BorderRadius.circular(4)),
                  child: value
                      ? Center(
                          child: Icon(
                            Icons.check,
                            color: AppColors.black,
                            size: 18,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (label is String)
                  Flexible(
                    child: Text(
                      label,
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                if (label is Widget) label
              ],
            ),
          ),
        ),
      ),
    );
  }
}

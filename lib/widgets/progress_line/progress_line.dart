import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';

class ProgressLine extends StatelessWidget {
  final double progress;
  final Color backgroundColor;
  final Color lineColor;

  ProgressLine({@required this.progress, this.backgroundColor, this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: backgroundColor ?? AppColors.white,
      ),
      clipBehavior: Clip.antiAlias,
      height: 7,
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: FractionallySizedBox(
        widthFactor: progress,
        child: Container(
          color: lineColor ?? AppColors.black,
          height: 7,
        ),
      ),
    );
  }
}

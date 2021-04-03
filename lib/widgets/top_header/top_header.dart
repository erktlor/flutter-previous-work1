import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/images.dart';

class TopHeader extends StatefulWidget {
  @override
  _TopHeaderState createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  bool scrolled = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: scrolled ? 80 : 60,
      color: scrolled ? AppColors.white : Colors.transparent,
      duration: const Duration(milliseconds: 300),
      padding: scrolled ? const EdgeInsets.all(16) : const EdgeInsets.all(8),
      child: Row(
        children: [
          Image(
            image: NetworkImage(Images.lightHeaderLogo),
          )
        ],
      ),
    );
  }
}

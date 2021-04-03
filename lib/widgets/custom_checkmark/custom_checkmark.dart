import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';

enum CustomCheckmarkSize { big, small }

class CustomCheckmark extends StatelessWidget {
  final bool checked;
  final bool active;
  final CustomCheckmarkSize size;

  CustomCheckmark(
      {@required this.checked,
      this.active = false,
      this.size = CustomCheckmarkSize.big});

  getSize() {
    switch (size) {
      case CustomCheckmarkSize.big:
        return 26.0;
      case CustomCheckmarkSize.small:
        return 16.0;
    }
  }

  getBorder() {
    switch (size) {
      case CustomCheckmarkSize.big:
        return Border.all(
            color: active ? AppColors.gray3 : AppColors.gray20, width: 4);
      case CustomCheckmarkSize.small:
        return Border.all(
            color: active ? AppColors.gray3 : AppColors.gray20, width: 2);
    }
  }

  BoxDecoration getDecoration() {
    if (checked) {
      return BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(getSize() / 2),
      );
    } else {
      return BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(getSize() / 2),
          border: getBorder());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize();

    return Container(
      width: size,
      height: size,
      decoration: getDecoration(),
      child: checked
          ? Icon(
              Icons.check,
              color: AppColors.white,
              size: size * 0.6,
            )
          : SizedBox.shrink(),
    );
  }
}

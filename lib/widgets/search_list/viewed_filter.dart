import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';

class ViewedFilter extends StatelessWidget {
  static const String showAll = 'Show all';
  static const String notViewed = 'Not Viewed';
  static const String viewed = 'Viewed';
  static const String favourite = 'Favourite';

  final String value;
  final List<String> options;
  final Function(String) onChange;

  ViewedFilter({this.value, this.options, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: AppColors.gray3)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child:
            DropdownButton<String>(value: value, onChanged: onChange, items: [
          for (final option in options)
            DropdownMenuItem(child: Text('Filter: $option'), value: option),
        ]),
      ),
    );
  }
}

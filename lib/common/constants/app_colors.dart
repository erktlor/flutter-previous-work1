import 'package:flutter/material.dart';

class AppColors {
  static final Color black = Colors.black;
  static final Color white = Colors.white;

  static final Color green0 = Color(0xff19FFB4);
  static final Color green1 = Color(0xff1BB37E);

  static final Color gray0 = Color(0xff666666);
  static final Color gray1 = Color(0xffF9F9F9);
  static final Color gray2 = Color(0xffF5F5F5);
  static final Color gray3 = Color(0xff1D1D20);
  static final Color gray4 = Color(0xffF1F1F1);
  static final Color gray5 = Color(0xff191919);
  static final Color gray6 = Color(0xff999999);
  static final Color gray7 = Color(0xffF2F2F2);
  static final Color gray8 = Color(0xff2B2C33);
  static final Color gray9 = Color(0xffD9D9D9);
  static final Color gray10 = Color(0xff4E4E4E);
  static final Color gray11 = Color(0xffE2E2E2);
  static final Color gray12 = Color(0xff808285);
  static final Color gray13 = Color(0xffe5e5e5);
  static final Color gray14 = Color(0xffDDDDDD);
  static final Color gray15 = Color(0xffEEEEEE);
  static final Color gray16 = Color(0xff111111);
  static final Color gray17 = Color(0xffBCBEC0);
  static final Color gray18 = Color(0xffcdcccc);
  static final Color gray19 = Color(0xffF0F3F6);
  static final Color gray20 = Color(0xffe2e7ed);
  static final Color gray21 = Color(0xff495255);
  static final Color gray22 = Color(0xff333333);
  static final Color gray23 = Color(0xffEEEEEE);
  static final Color gray24 = Color(0xffCCCCCC);
  static final Color gray25 = Color(0xff8D939B);
  static final Color gray26 = Color(0xff1c1c1c);
  static final Color gray27 = Color(0xffE6E6E6);
  static final Color gray28 = Color(0xff4d4d4d);

  static final Color blue0 = Color(0xff0178CA);
  static final Color blue1 = Color(0xff00FFFF);
  static final Color blue2 = Color(0xff299ED7);
  static final Color blue3 = Color(0xff0385C4);
  static final Color blue4 = Color(0xff015279);
  static final Color blue5 = Color(0xffEFF3F6);
  static final Color blue6 = Color(0xff7FFFFF);
  static final Color blue7 = Color(0xff345878);

  static final Color orange0 = Color(0xffFE5630);

  static toHexString(Color color) {
    return '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
}

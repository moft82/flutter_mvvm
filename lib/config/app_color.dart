import 'package:flutter/material.dart';

class AppColor {
  // Primary Color
  static const primaryColor = Color(0xff7289DA);
  static const subColorBright = Color(0xff99aab5);
  static const subColorDark = Color(0xff2c2f33);
  static const subColorDarker = Color(0xff23272a);

  static const gradientColor = LinearGradient(colors: [
    primaryColor,
    subColorBright,
    subColorDark,
    subColorDarker,
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  // Gray Color
  static const grayColor01 = Color(0xffF8F9FB);
  static const grayColor02 = Color(0xffF8F8F8);
  static const grayColor03 = Color(0xffEEEEEE);
  static const grayColor04 = Color(0xffD1D1D1);
  static const grayColor05 = Color(0xffBCBCBC); // 본문 텍스트
  static const grayColor06 = Color(0xffACACAC);
  static const grayColor07 = Color(0xff989898); // 카드 텍스트
  static const grayColor08 = Color(0xff727272); // 본문 텍스트
  static const grayColor09 = Color(0xff484848);
  static const grayColor10 = Color(0xff1B1B1B);

  // State Color
  static const error = Color(0xffFF0000);
  static const warning = Color(0xffFF0000);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
}

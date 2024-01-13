import 'package:flutter/material.dart';

class AppColor {
  // Primary Color
  static const primaryColor = Color(0xff6C44FD);
  static const gradientColor = LinearGradient(colors: [
    Color(0xffC46CFF),
    Color(0xffC46CFF),
    Color(0xff9458FE),
    Color(0xff6C44FD),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const whitegradientColor = LinearGradient(colors: [
    Color(0xffFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  // 이용방법
  static const useGradientColor = LinearGradient(colors: [
    Color(0xffc46cff),
    Color(0xff9458fe),
    Color(0xff744bfd),
    Color(0xff6c44fd)
  ], begin: Alignment.centerRight, end: Alignment.centerLeft);


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
  static const success = Color(0xff6C44FD);
  static const error = Color(0xffFF0000);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
}

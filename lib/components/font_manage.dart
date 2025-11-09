import 'package:flutter/material.dart';
import 'color_manage.dart';

class AppFonts {
  static const String systemFont = 'Pretendard';

  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;

  static TextStyle blackTitle({
    double size = 20,
  }) {
    return TextStyle(
      fontFamily: systemFont,
      fontWeight: bold,
      fontSize: size,
      color: AppColors.grey(9),
    );
  }

  static TextStyle greyTitle({
    double size = 20,
  }) {
    return TextStyle(
      fontFamily: systemFont,
      fontWeight: bold,
      fontSize: size,
      color: AppColors.grey(7),
    );
  }

  static TextStyle whiteTitle({
    double size = 20,
  }) {
    return TextStyle(
      fontFamily: systemFont,
      fontWeight: bold,
      fontSize: size,
      color: Colors.white,
    );
  }
}

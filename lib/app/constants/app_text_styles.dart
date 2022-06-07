import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFontSize {
  static const double fontTextTitle = 22.0;
  static const double fontTextBig = 22.0;
  static const double fontText = 16.0;
  static const double fontTextSmall = 12.0;
  static const double fontExtraSmall = 8.0;
  static const double fontTextExtraBig = 31;
  static const double fontErrorText = 14;

  static const double fontHeight = 1.2;
}

class AppTextStyles {
  AppTextStyles._();

  static String get fontFamilyHkGrotesk => 'HKGrotesk';

  static TextStyle get normal => TextStyle(
    height: AppFontSize.fontHeight,
    fontFamily: fontFamilyHkGrotesk,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSize.fontText,
  );

  static TextStyle get normalBold => normal.copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get normalBoldBlack => normal.copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w900,
  );

  static TextStyle get normalSemiBold => normal.copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get normalRegular => normal.copyWith(
    fontSize: AppFontSize.fontText,
    fontWeight: FontWeight.w400,
  );

}

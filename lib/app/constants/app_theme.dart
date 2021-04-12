import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: COLOR_PRIMARY_DARK,
  accentColor: COLOR_PRIMARY,
  splashColor: COLOR_PRIMARY,
  highlightColor: COLOR_PRIMARY_LIGHT,
  fontFamily: FONT_FAMILY,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

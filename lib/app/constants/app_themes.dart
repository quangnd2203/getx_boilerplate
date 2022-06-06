import 'package:flutter/material.dart';

import '../utils/app_utils.dart';
import 'constants.dart';

ThemeData normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: AppTextStyles.fontFamilyHkGrotesk,
    brightness: AppUtils.valueByMode(values: <Brightness>[Brightness.light, Brightness.dark]),
  );
}

import 'package:flutter/material.dart';

import '../utils/app_utils.dart';
import 'constants.dart';

normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: AppTextStyles.fontFamilyRoboto,
    brightness: AppUtils.valueByMode(values: [Brightness.dark, Brightness.light]),
  );
}

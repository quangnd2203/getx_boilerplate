import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../ui/ui.dart';
import '../utils/app_utils.dart';

class AppColors {
  AppColors._();

  static Color get primary => AppUtils.valueByMode(values: [primaryLight, primaryLight]);

  static Color get primaryDark => HexColor.fromHex('#FF6915');

  static Color get primaryLight => HexColor.fromHex('#FF6915');

  static Color get text => AppUtils.valueByMode(values: [textLight, textLight]);

  static Color get textDark => Colors.white;

  static Color get textLight => Colors.black;

}

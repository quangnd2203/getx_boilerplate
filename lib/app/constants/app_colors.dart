import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../ui/ui.dart';
import '../utils/app_utils.dart';

class AppColors {
  AppColors._();

  static Color get primary => AppUtils.valueByMode(values: [primaryDark, primaryLight]);

  static Color get primaryDark => fromHex('#FF6915');

  static Color get primaryLight => fromHex('#FF6915');

  static Color get text => AppUtils.valueByMode(values: [textDark, textLight]);

  static Color get textDark => Colors.white;

  static Color get textLight => Colors.black;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../ui/ui.dart';

class AppColors {
  AppColors._();

  static Color get primary => HexColor.fromHex('#E2AE5D');

  static Color get text => HexColor.fromHex('#333333');

  static Color byTheme(BuildContext context, {required Color light, required Color dark}) =>
      AppThemeMode.of(context).isDark ? dark : light;

  static Color backgroundByTheme(BuildContext context, {Color? light, Color? dark}) =>
      AppThemeMode.of(context).isDark ? dark ?? text : light ?? Colors.white;

  static Color textByTheme(BuildContext context, {Color? light, Color? dark}) =>
      AppThemeMode.of(context).isDark ? dark ?? Colors.white : light ?? text;
}

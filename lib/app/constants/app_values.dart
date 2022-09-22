import 'package:flutter/material.dart';
import 'package:get/get.dart';

double get viewPaddingTop => Get.mediaQuery.viewPadding.top;

const String APP_NAME = 'NTA-Attendance';

/// FLAVOR = dev => development
/// FLAVOR = prod => product
const String FLAVOR = String.fromEnvironment('FLAVOR');

enum AppLocale {
  vi(Locale('vi', 'VN')),
  en(Locale('en', 'US')),
  ja(Locale('ja', 'JP'));

  const AppLocale(this._locale);
  final Locale _locale;
  Locale get value => _locale;
}

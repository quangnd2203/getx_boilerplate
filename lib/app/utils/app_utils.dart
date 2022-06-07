// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

import '../constants/constants.dart';
import 'utils.dart';

class AppUtils {
  AppUtils._();

  static void toast(String? message, {Duration? duration}) {
    if(message != null){
      showOverlayNotification((BuildContext context) {
        return SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary,
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.normalBold.copyWith(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        );
      }, duration: duration ?? const Duration(milliseconds: 2000));
    }
  }

  static const List<String> _themes = <String>['dark', 'light'];

  static T valueByMode<T>({List<String> themes = _themes, required List<T> values}) {
    try {
      for (int i = 0; i < themes.length; i++) {
        if (AppPrefs.appMode == themes[i]) {
          if (i < values.length)
            return values[i];
          else
            values.first;
        }
      }
      return values.first;
    } catch (e) {
      return values.first;
    }
  }

  static String pathMediaToUrl(String? url) {
    if (url == null || url.startsWith('http')) {
      return url ?? '';
    }
    return "${"AppEndpoint.BASE_UPLOAD_URL"}$url";
  }

  static String convertDateTime2String(DateTime? dateTime, {String format = 'yy-MM-dd'}) {
    if (dateTime == null){
      return '';
    }
    return DateFormat(format).format(dateTime);
  }

  static DateTime? convertString2DateTime(String? dateTime,
      {String format = 'yyyy-MM-ddTHH:mm:ss.SSSZ'}) {
    if (dateTime == null){
      return null;
    }
    return DateFormat(format).parse(dateTime);
  }

  static String convertString2String(String? dateTime,
      {String inputFormat = 'yyyy-MM-ddTHH:mm:ss.SSSZ', String outputFormat = 'yyyy-MM-dd'}) {
    if (dateTime == null){
      return '';
    }
    final DateTime? input = convertString2DateTime(dateTime, format: inputFormat);
    return convertDateTime2String(input, format: outputFormat);
  }

  static String minimum(int? value) {
    if (value == null){
      return '00';
    }
    return value < 10 ? '0$value' : '$value';
  }

  static String convertPhoneNumber(String phone, {String code = '+84'}) {
    return '$code${phone.substring(1)}';
  }
}

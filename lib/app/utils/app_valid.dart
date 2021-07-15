import 'package:get/get.dart';

class AppValid {
  AppValid._();

  static validatePhone() {
    return (value) {
      if (value == null || value.length == 0) return 'valid_enter_phone'.tr;
      RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
      if (!regex.hasMatch(value)) return 'valid_phone'.tr;
    };
  }

  static validateFullName() {
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_full_name'.tr;
      }
      return null;
    };
  }

  static validateEmail() {
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_enter_email'.tr;
      } else {
        RegExp regex = new RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
        if (!regex.hasMatch(value))
          return 'valid_email'.tr;
        else
          return null;
      }
    };
  }

  static validatePassword() {
    return (value) {
      if (value == null || value.length < 6) {
        return 'valid_password'.tr;
      } else {
        RegExp regex = new RegExp(r'^[0-9a-zA-Z!@#\$&*~]{6,}$');
        if (!regex.hasMatch(value))
          return 'valid_password'.tr;
        else
          return null;
      }
    };
  }

  static validatePhoneNumber() {
    RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_enter_phone'.tr;
      } else if (value.length != 10) {
        return 'valid_phone'.tr;
      } else if (!regex.hasMatch(value)) {
        return 'valid_phone'.tr;
      } else {
        return null;
      }
    };
  }
}

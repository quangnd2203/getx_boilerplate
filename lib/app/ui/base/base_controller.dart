import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ui.dart';

class BaseController extends GetxController {
  var loading = false.obs;

  setLoading(bool status) {
    if (status)
      loading.value = true;
    else
      loading.value = false;
  }

  easyLoading(bool status) {
    if (status) {
      if (!EasyLoading.isShow) EasyLoading.show();
    } else if (EasyLoading.isShow) EasyLoading.dismiss();
  }

  Future<bool> showRequestConfirm(
      {@required String content,
      String keyTitle,
      bool transTitle = true,
      bool transContent = false,
      Function actionCancel,
      Function actionConfirm}) async {
    return await Get.dialog(DialogConfirm(
      keyTitle: keyTitle,
      actionCancel: actionCancel,
      transTitle: transTitle,
      transContent: transContent,
      content: content,
      actionConfirm: actionConfirm,
    ));
  }

  Future<dynamic> showNotification(
      {@required String keyTitle,
      bool trans = true,
      String keyAction,
      Function action}) async {
    await Get.dialog(DialogNotification(
      keyTitle: keyTitle,
      action: action,
      trans: trans,
      keyAction: keyAction,
    ));
  }
}

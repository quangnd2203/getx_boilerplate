import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';

import '../ui.dart';

class StartScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Image.asset(
              AppImages.imgStart,
              width: Get.width,
              fit: BoxFit.fill,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'welcome'.tr,
                      style: STYLE_SMALL_BOLD.copyWith(
                          fontSize: 32, color: TEXT_COLOR),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'welcome_description'.tr,
                      style: STYLE_LARGE.copyWith(color: TEXT_HINT_COLOR),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WidgetRaisedGradientButton(
                      onPressed: () => Get.toNamed(Routes.SIGN_IN),
                      width: Get.width * 3 / 5,
                      height: 45,
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [COLOR_PRIMARY, COLOR_PRIMARY_DARK]),
                      child: Text(
                        'sign_in'.tr.toUpperCase(),
                        style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WidgetRaisedOutlineButton(
                      onPressed: () => Get.toNamed(Routes.SIGN_UP),
                      height: 45,
                      width: Get.width * 3 / 5,
                      color: COLOR_PRIMARY,
                      borderRadius: BorderRadius.circular(4),
                      child: Text('sign_up'.tr.toUpperCase(),
                          style: STYLE_MEDIUM_BOLD.copyWith(
                              color: COLOR_PRIMARY_DARK)),
                    )
                  ],
                ),
                const SizedBox(),
              ],
            ))
          ],
        ));
  }
}

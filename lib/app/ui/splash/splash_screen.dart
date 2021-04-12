import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_images.dart';

import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          tween: Tween<double>(begin: 0, end: 1),
          builder: (_, value, child) => Opacity(
            opacity: value,
            child: child,
          ),
          child: Image.asset(
            AppImages.icLauncher,
            width: Get.width / 3,
            height: Get.width / 3,
          ),
        )));
  }
}

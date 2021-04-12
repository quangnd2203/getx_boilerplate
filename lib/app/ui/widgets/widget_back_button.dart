import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_colors.dart';
import 'package:werewolf_client/app/constants/app_images.dart';

class WidgetBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(
          AppImages.icArrowBack,
          color: TEXT_COLOR,
        ),
        onPressed: () => Get.back());
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_images.dart';

import '../ui.dart';

class RoomScreen extends BaseScreen<RoomController> {
  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            AppImages.icLauncher,
            width: Get.width / 3,
            height: Get.width / 3,
          ),
        ));
  }
}

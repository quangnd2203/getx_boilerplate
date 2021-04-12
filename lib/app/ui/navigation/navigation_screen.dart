import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';

import '../ui.dart';

class NavigationScreen extends BaseScreen<NavigationController> {
  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            color: Color.fromRGBO(33, 32, 52, 1),
            image: DecorationImage(
                image: AssetImage(AppImages.imgWerewolf),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.scaleDown)),
        // child: GetX<NavigationController>(builder: (_) => _buildBody()),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: WidgetRaisedGradientButton(
        onPressed: controller.playNow,
        width: Get.width * 3 / 5,
        height: 45,
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [COLOR_PRIMARY, COLOR_PRIMARY_DARK]),
        child: Text(
          'play_now'.tr.toUpperCase(),
          style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

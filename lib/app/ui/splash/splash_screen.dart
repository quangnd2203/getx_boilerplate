// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_text_styles.dart';
import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('splash_getting'.tr, style: AppTextStyles.normalBoldBlack,),
      ),
    );
  }
}

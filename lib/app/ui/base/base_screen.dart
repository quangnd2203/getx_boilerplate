// ignore_for_file: flutter_style_todos

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../ui.dart';

class BaseScreen<T extends BaseController> extends GetResponsiveView<T>{
  BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<T>(
      dispose: (GetXState<T> state) {
        Logger().d('DISPOSE: "$runtimeType" - "$T"');
        Get.delete<T>();
      },
      builder: (BaseController controller) {
        return WidgetLoadingFullScreen(
          loading: controller.loading.value,
          child: builder()!,
        );
      },
    );
  }

  @override
  Widget? builder() {
    // TODO: implement builder
    switch(screen.screenType){
      case ScreenType.Phone: return phone();
      case ScreenType.Desktop: return desktop();
      case ScreenType.Tablet: return tablet();
      case ScreenType.Watch: return watch();
    }
  }

  @override
  Widget desktop() {
    return const SizedBox();
  }

  @override
  Widget phone() {
    return const SizedBox();
  }

  @override
  Widget tablet() {
    return const SizedBox();
  }

  @override
  Widget watch() {
    return const SizedBox();
  }

}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

import '../ui.dart';

abstract class BaseScreen<T extends BaseController> extends GetResponsiveView<T>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<T>(
      dispose: (state) {
        Logger().d('DISPOSE: "${this.runtimeType}" - "$T"');
        Get.delete<T>();
      },
      builder: (controller) {
        return WidgetLoadingFullScreen(
          child: builder()!,
          loading: controller.loading.value,
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
    return SizedBox();
  }

  @override
  Widget phone() {
    return SizedBox();
  }

  @override
  Widget tablet() {
    return SizedBox();
  }

  @override
  Widget watch() {
    return SizedBox();
  }

}

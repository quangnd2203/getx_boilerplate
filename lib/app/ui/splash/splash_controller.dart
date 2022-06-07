import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../ui.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getConfig();
    await getProfile();
  }

  Future<void> getConfig() async {}

  Future<void> getProfile() async {
    Get.offAllNamed(Routes.NAVIGATION);
  }
}

import 'package:get/get.dart';

import '../ui.dart';

class SplashController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    await getConfig();
    await getProfile();
  }

  Future getConfig() async {}

  getProfile() async {}
}

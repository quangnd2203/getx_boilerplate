import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/repository/user_repository.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';
import 'package:werewolf_client/app/utils/app_pref.dart';

class SplashController extends BaseController {
  final ConfigRepository _configRepository = ConfigRepository();
  final UserRepository _userRepository = UserRepository();

  @override
  void onInit() async {
    super.onInit();
    await getConfig();
    await getProfile();
  }

  Future getConfig() async {
    NetworkResponse<ConfigModel> response = await _configRepository.getConfig();
    if (response.isSuccess) {
      AppPref.config = response.data;
    }
  }

  getProfile() async {
    NetworkResponse<UserModel> response = await _userRepository.getProfile();
    if (response.isSuccess) {
      AppPref.user = response.data;
      Get.offNamed(Routes.NAVIGATION);
    } else
      Get.offNamed(Routes.START);
  }
}

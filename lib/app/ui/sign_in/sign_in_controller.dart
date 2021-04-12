import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';
import 'package:werewolf_client/app/utils/utils.dart';

class SignInController extends BaseController {
  final AuthRepository _authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final obscureText = true.obs;

  String get username => usernameController.text;

  String get password => passwordController.text;

  @override
  void onInit() {
    super.onInit();
  }

  signIn(SignInType type) async {
    easyLoading(true);
    NetworkResponse<SignInResponseModel> response;
    switch (type) {
      case SignInType.normal:
        if (!formKey.currentState.validate()) return;
        response = await _authRepository.postSignIn(
            username: username, password: password, type: type);
        easyLoading(false);
        break;
      case SignInType.facebook:
        LoginSocialResult result = await SocialService().signInFacebook();
        response = await _authRepository.postSignIn(result: result, type: type);
        easyLoading(false);
        break;
      case SignInType.google:
        LoginSocialResult result = await SocialService().signInGoogle();
        response = await _authRepository.postSignIn(result: result, type: type);
        easyLoading(false);
        break;
      default:
        break;
    }
    showNotification(
        keyTitle: response.msg,
        trans: false,
        action: () {
          Get.back();
          if (response.isSuccess) {
            AppPref.user = response.data.user;
            AppPref.accessToken = response.data.accessToken;
            Get.offNamed(Routes.NAVIGATION);
          }
        });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';

class SignUpController extends BaseController {
  final AuthRepository _authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final obscureText = true.obs;

  String get email => emailController.text;

  String get username => usernameController.text;

  String get password => passwordController.text;

  @override
  void onInit() {
    super.onInit();
  }

  signUp() async {
    FocusScope.of(Get.context).unfocus();
    easyLoading(true);
    if (!formKey.currentState.validate()) return;
    NetworkResponse<SignInResponseModel> response = await _authRepository
        .postSignUp(username: username, password: password, email: email);
    easyLoading(false);
    showNotification(
        keyTitle: response.msg,
        trans: false,
        action: () {
          Get.back();
          if (response.isSuccess) Get.offNamed(Routes.SIGN_IN);
        });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}

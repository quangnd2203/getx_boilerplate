import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';

import '../ui.dart';

class SignInScreen extends BaseScreen<SignInController> {
  @override
  Widget buildMobile(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: WidgetBackButton(),
                ),
                Expanded(
                    child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 80),
                      child: Form(
                        key: controller.formKey,
                        child: GetX<SignInController>(
                          builder: (_) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi wolf!',
                                  style:
                                      STYLE_SMALL_BOLD.copyWith(fontSize: 32),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'sign_in_description'.tr,
                                  style: STYLE_LARGE.copyWith(
                                      color: TEXT_HINT_COLOR),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 65,
                                ),
                                WidgetInputUnderline(
                                  controller: controller.usernameController,
                                  hint: 'Username...',
                                  style: STYLE_MEDIUM.copyWith(
                                      color: TEXT_COLOR),
                                  hintStyle: STYLE_MEDIUM.copyWith(
                                      color: TEXT_HINT_COLOR),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WidgetInputUnderline(
                                  controller: controller.passwordController,
                                  hint: 'Password...',
                                  suffixIcon: controller.obscureText.value
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.visibility_off_rounded,
                                            color: TEXT_HINT_COLOR,
                                          ),
                                          onPressed: () => controller
                                              .obscureText.value = false)
                                      : IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye_rounded,
                                              color: TEXT_HINT_COLOR),
                                          onPressed: () => controller
                                              .obscureText.value = true),
                                  obscureText: controller.obscureText.value,
                                  inputType: TextInputType.visiblePassword,
                                  style: STYLE_MEDIUM.copyWith(
                                      color: TEXT_COLOR),
                                  hintStyle: STYLE_MEDIUM.copyWith(
                                      color: TEXT_HINT_COLOR),
                                ),
                                const SizedBox(
                                  height: 65,
                                ),
                                Center(
                                  child: WidgetRaisedGradientButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      controller.signIn(SignInType.normal);
                                    },
                                    width: Get.width * 3 / 5,
                                    height: 45,
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          COLOR_PRIMARY,
                                          COLOR_PRIMARY_DARK
                                        ]),
                                    child: Text(
                                      'sign_in'.tr.toUpperCase(),
                                      style: STYLE_MEDIUM_BOLD.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Text(
                                    'forgot_password'.tr,
                                    style: STYLE_SMALL_BOLD.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: COLOR_PRIMARY),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 0.8,
                                        color: TEXT_HINT_COLOR,
                                        width: Get.width,
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 24),
                                        child: Text(
                                          'or',
                                          style: STYLE_MEDIUM_BOLD.copyWith(
                                              color: COLOR_PRIMARY,
                                              fontWeight: FontWeight.w800),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: 0.8,
                                        color: TEXT_HINT_COLOR,
                                        width: Get.width,
                                      )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'social_media_login'.tr,
                                    style: STYLE_SMALL_BOLD.copyWith(
                                        color: TEXT_HINT_COLOR),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          controller.signIn(SignInType.google);
                                        },
                                        child: Image.asset(
                                          AppImages.icGoogle,
                                          width: 42,
                                          height: 42,
                                        )),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        controller.signIn(SignInType.facebook);
                                      },
                                      child: Image.asset(
                                        AppImages.icFacebook,
                                        width: 46,
                                        height: 46,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 45,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'do_not_have_an_account'.tr,
                                      style: STYLE_SMALL_BOLD.copyWith(
                                          color: TEXT_HINT_COLOR),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    InkWell(
                                      onTap: () => Get.offNamed(Routes.SIGN_UP),
                                      child: Text(
                                        'sign_up'.tr,
                                        style: STYLE_SMALL_BOLD.copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            color: COLOR_PRIMARY),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}

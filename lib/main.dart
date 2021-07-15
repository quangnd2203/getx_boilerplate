import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/notification/notification.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/ui/splash/splash_screen.dart';
import 'app/ui/splash/splash_binding.dart';
import 'app/utils/utils.dart';
import 'app/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppPref.initListener();
  notificationInitialed();

  runApp(WidgetThemeSwitcher(
      init: AppThemeModeType.light,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: SplashBinding(),
        initialRoute: Routes.SPLASH,
        theme: appThemeData,
        defaultTransition: Transition.fadeIn,
        getPages: AppPages.pages,
        home: SplashScreen(),
        locale: Locale('vi', 'VN'),
        translationsKeys: AppTranslation.translations,
      )));
}

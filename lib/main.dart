import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/constants/constants.dart';
import 'app/notification/notification.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
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

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetThemeSwitcher(
        init: AppThemeModeType.light, child: MyApp());
  }
}

class MyApp extends StatefulWidget {
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AppDeviceInfo.init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("ChangeAppLifecycleState: $state");
  }

  @override
  Widget build(BuildContext context) {
    return WidgetThemeSwitcher(
        init: AppThemeModeType.light,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: SplashBinding(),
          initialRoute: Routes.SPLASH,
          theme: appThemeData,
          defaultTransition: Transition.cupertino,
          getPages: AppPages.pages,
          home: SplashScreen(),
          locale: Locale('vi', 'VN'),
          translationsKeys: AppTranslation.translations,
          navigatorObservers: <NavigatorObserver>[MyApp.observer],
        ));
  }
}

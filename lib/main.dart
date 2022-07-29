// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/constants/constants.dart';
import 'app/notification/firebase_messaging.dart';
import 'app/notification/notification.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/ui/ui.dart';
import 'app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await AppPrefs.initListener();
  await notificationInitialed();
  Logger().d('RUNNING IN $FLAVOR ENVIRONMENT'.toUpperCase());
  print('FCM TOKEN: ${await FirebaseCloudMessaging.getFCMToken()}');
  runApp(const OverlaySupport(child: RestartWidget(child: App())));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
        initialThemeData: normalTheme(context), child: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    print('ChangeAppLifecycleState: $state');
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        defaultTransition: Transition.cupertino,
        getPages: AppPages.pages,
        locale: const Locale('vi', 'VN'),
        translationsKeys: AppTranslation.translations,
        navigatorObservers: <NavigatorObserver>[MyApp.observer],
      ),
    );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/constants/constants.dart';
import 'app/notification/notification.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/utils/utils.dart';
import 'app/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await AppPrefs.initListener();
  await notificationInitialed();
  runApp(OverlaySupport(child: RestartWidget(child: App())));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
        initialThemeData: normalTheme(context), child: MyApp());
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.pages,
      locale: Locale('vi', 'VN'),
      translationsKeys: AppTranslation.translations,
      navigatorObservers: <NavigatorObserver>[MyApp.observer],
    );
  }
}

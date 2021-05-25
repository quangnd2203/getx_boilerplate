import 'package:get/get.dart';
import '../ui/ui.dart';

part './app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page:()=> SplashScreen(),),

    GetPage(name: Routes.NAVIGATION, page:()=> NavigationScreen(), binding: NavigationBinding()),
  ];
}
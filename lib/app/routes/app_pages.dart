import 'package:get/get.dart';
import '../ui/ui.dart';

part './app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page:()=> SplashScreen(),),

    GetPage(name: Routes.START, page:()=> StartScreen(),),
    GetPage(name: Routes.SIGN_IN, page:()=> SignInScreen(), binding: SignInBinding()),
    GetPage(name: Routes.SIGN_UP, page:()=> SignUpScreen(), binding: SignUpBinding()),

    GetPage(name: Routes.NAVIGATION, page:()=> NavigationScreen(), binding: NavigationBinding()),
    GetPage(name: Routes.ROOM, page:()=> RoomScreen(), binding: RoomBinding()),
  ];
}
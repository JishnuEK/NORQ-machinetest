import 'package:get/get.dart';
import 'package:test16032024/modules/cart/controller/cart_binding.dart';
import 'package:test16032024/modules/cart/view/screen_cart.dart';
import 'package:test16032024/modules/home/controller/home_binding.dart';
import 'package:test16032024/modules/home/screen/screen_home.dart';
import 'package:test16032024/modules/login/views/screen_login.dart';
import 'package:test16032024/modules/login/views/screen_register.dart';
import 'package:test16032024/modules/splash/screen_splashscreen.dart';
import 'package:test16032024/routes/app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const ScreenSplash(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => ScreenLogin(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => ScreenRegister(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const ScreenHome(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => const ScreenCart(),
      binding: CartBinding(),
    ),
  ];
}

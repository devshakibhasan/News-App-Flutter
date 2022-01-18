import '/src/views/home/home_bindings.dart';
import '/src/views/splash%20screen/splash.dart';
import 'app_routes.dart';
import 'package:get/get.dart';
class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => MySplashScreen(),
      binding: HomeBinding(),
    ),
  ];
}

import 'package:news_app/views/home/home_bindings.dart';
import 'package:news_app/views/home/home_page.dart';
import 'app_routes.dart';
import 'package:get/get.dart';
class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => MyHomePage(),
      binding: HomeBinding(),
    ),
  ];
}

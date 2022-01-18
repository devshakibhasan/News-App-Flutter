import 'package:get/get.dart';
import 'package:news_app/src/controllers/home_api_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

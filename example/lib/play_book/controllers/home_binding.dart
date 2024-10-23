

import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy load the HomeController when it's needed
    Get.put(() => HomePageController());
  }
}

import 'package:cana_cabana/core/controllers/cart_controller.dart';
import 'package:cana_cabana/core/controllers/home_controller.dart';
import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/core/controllers/profile_controller.dart';
import 'package:cana_cabana/core/controllers/search_controller.dart';

import 'package:get/get.dart';

class HomeWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeWrapperController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => SearchScreenController());
    Get.lazyPut(() => ProfileController());
  }
}

import 'package:cana_cabana/core/controllers/delivery_info_controller.dart';

import 'package:get/get.dart';

class DeliveryInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryInfoController());
  }
}

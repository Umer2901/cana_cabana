import 'package:cana_cabana/core/controllers/add_new_card_controller.dart';
import 'package:cana_cabana/core/controllers/select_store_controller.dart';

import 'package:get/get.dart';

class SelectStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectStoreController());
  }
}

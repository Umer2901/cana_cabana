import 'package:cana_cabana/core/controllers/add_new_card_controller.dart';

import 'package:cana_cabana/core/controllers/sign_up_controller.dart';

import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}

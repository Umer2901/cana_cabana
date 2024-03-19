import 'package:cana_cabana/core/controllers/receipt_controller.dart';
import 'package:get/get.dart';

class ReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReceiptController());
  }
}

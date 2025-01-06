import 'package:cana_cabana/core/controllers/receipt_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/delivery_info.dart';
import 'package:get/get.dart';

class ReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryInfo());
  }
}

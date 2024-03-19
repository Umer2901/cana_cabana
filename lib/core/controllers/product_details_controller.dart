import 'package:cana_cabana/models/product.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late Product product;
  late RxInt selectedOfferIndex;
  RxInt quantity = 1.obs;
  @override
  void onInit() {
    product = Get.arguments;
    selectedOfferIndex = (-1).obs;
    super.onInit();
  }

  RxString totalPrice() {
    if (selectedOfferIndex.value == -1) {
      return "0.00".obs;
    }
    return (double.parse(product
                .variants[selectedOfferIndex.value].metafields[0].price) *
            quantity.value)
        .toStringAsFixed(1)
        .obs;
  }
}

import 'package:cana_cabana/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;

  RxString totalAmount() {
    double total = 0;
    for (var element in cartItems) {
      total += double.parse(element.variant.metafields[0].price);
    }
    RxString totalString = total.toStringAsFixed(2).obs;
    return totalString;
  }

  RxString savings() {
    double savings = 0;
    for (var element in cartItems) {
      savings += double.parse(element.variant.metafields[0].price) -
          double.parse(element.variant.metafields[0].memberPrice);
    }
    RxString totalString = savings.toStringAsFixed(2).obs;
    return totalString;
  }

  RxString equivalentAmount() {
    double amount = 0;
    for (var element in cartItems) {
      amount += convertOuncesToGrams(element.variant.metafields[0].quantity);
    }
    RxString totalString = amount.toStringAsFixed(1).obs;
    return totalString;
  }

  double convertOuncesToGrams(String input) {
    double grams = 0;
    if (input == "each") {
      return 0;
    }
    switch (input.toLowerCase()) {
      case "half_gram":
        grams = 1.5;
      case 'eighth_ounce':
        grams = 3.5; // 1 eighth ounce is equivalent to 3.5 grams
        break;
      case 'quarter_ounce':
        grams = 7.0; // 1 quarter ounce is equivalent to 7.0 grams
        break;
      case 'ounce':
        grams = 28.35; // 1 ounce is equivalent to 28.35 grams
        break;
    }

    return grams;
  }
}

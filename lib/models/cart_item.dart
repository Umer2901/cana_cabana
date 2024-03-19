import 'package:cana_cabana/models/offer.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/models/variants.dart';

class CartItem {
  String name;
  Product product;
  String id;
  Variant variant;
  double? thcPercentage;
  double? cbdPercentage;
  String description;
  int quantity;
  CartItem({
    required this.name,
    required this.quantity,
    required this.id,
    required this.description,
    this.thcPercentage,
    this.cbdPercentage,
    required this.variant,
    required this.product,
  });
}

import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/models/metafield.dart';
import 'package:cana_cabana/models/offer.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/models/variants.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  ScrollController productViewScrollController = ScrollController();

  String extractDate(String date) {
    int colonIndex = date.indexOf(':');
    if (colonIndex != -1) {
      String resultString = date.substring(colonIndex + 1).trim();
      return resultString;
    }
    return "Failed to extract hours";
    // Extract the substring starting from the character after the colon
  }

  RxBool loadingStores = true.obs;
  RxBool loadingProduct = true.obs;
  showInitLoadingIndicator() {
    showCustomDialog("Fetching stores near you",
        showLoading: true, barrierDismissible: false);
  }

  Future<List<Product>> getProductsByStore(int storeId,
      {int offset = 0}) async {
    if (offset == 0) {
      loadingProduct.value = true;
    }

    List<Product> newProducts =
        await apiService.getProductByStore(storeId, offset: offset);

    if (offset == 0) {
      products.value = newProducts;
    } else {
      products.addAll(newProducts);
    }

    update();
    loadingProduct.value = false;
    return products;
  }

  @override
  void onInit() async {
    final homeWrapperController = Get.find<HomeWrapperController>();
    selectedStore = homeWrapperController.selectedStore.obs;
    await getProductsByStore(homeWrapperController.selectedStore.id);
    update();
    super.onInit();
  }

  RxBool allProductsLoaded = false.obs;
  @override
  onReady() async {
    productViewScrollListener() async {
      if (productViewScrollController.position.pixels >
          productViewScrollController.position.maxScrollExtent) {
        if (products.length > highestOffsetCalled) {
          highestOffsetCalled = products.length;
          await getProductsByStore(selectedStore.value.id,
              offset: products.length);
        }
      }
    }

    productViewScrollController.addListener(productViewScrollListener);

    super.onReady();
  }

  @override
  void dispose() {
    productViewScrollController.dispose();
    super.dispose();
  }

  int highestOffsetCalled = 0;
  late Rx<Store> selectedStore;
  List<String> strains = [
    "Sativa",
    "Indica",
    "Hybrid",
  ];
  RxString selectedStrain = "".obs;
  Rx<SfRangeValues> sliderValues = const SfRangeValues(0.0, 20.0).obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Product> dummyProducts = [
    const Product(
        images: [],
        name: "Spinach Wedding Cake",
        id: 0,
        description:
            "A truly sought-after delicacy, Wedding Cake is known for its dense buds and frosty trichomes and are a delight for the senses. This strain has intense sweet, fruity, earthy, and spicy flavours with just a hint of vanilla.",
        offers: [
          Offer(price: 25, quantity: 3.5),
          Offer(price: 50, quantity: 7.5)
        ],
        variants: [
          Variant(
              title: "title",
              id: 1,
              productId: 2,
              description:
                  "A truly sought-after delicacy, Wedding Cake is known for its dense buds and frosty trichomes and are a delight for the senses. This strain has intense sweet, fruity, earthy, and spicy flavours with just a hint of vanilla.",
              metafields: [
                Metafield(
                    id: 4,
                    variantId: 1,
                    inStock: "10",
                    price: "10",
                    memberPrice: "6",
                    quantity: "half_gram",
                    thcPercentage: "81%",
                    cbdPercentage: "5%")
              ])
        ]),
    const Product(
        name: "Spinach Wedding Cake",
        id: 0,
        description:
            "A truly sought-after delicacy, Wedding Cake is known for its dense buds and frosty trichomes and are a delight for the senses. This strain has intense sweet, fruity, earthy, and spicy flavours with just a hint of vanilla.",
        offers: [
          Offer(price: 25, quantity: 3.5),
          Offer(price: 50, quantity: 7.5)
        ],
        variants: [
          Variant(
              title: "title",
              id: 1,
              productId: 2,
              description:
                  "A truly sought-after delicacy, Wedding Cake is known for its dense buds and frosty trichomes and are a delight for the senses. This strain has intense sweet, fruity, earthy, and spicy flavours with just a hint of vanilla.",
              metafields: [
                Metafield(
                    id: 4,
                    variantId: 1,
                    inStock: "10",
                    price: "10",
                    memberPrice: "6",
                    quantity: "half_gram",
                    thcPercentage: "81%",
                    cbdPercentage: "5%")
              ])
        ],
        images: []),
  ].obs;
}

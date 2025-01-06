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

class SearchResultsController extends GetxController {
  int collectionId;
  SearchResultsController(this.collectionId);

  ScrollController scrollController = ScrollController();
  Rx<SfRangeValues> sliderValues = const SfRangeValues(0.0, 20.0).obs;
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = true.obs;
  late Store selectedStore;
  @override
  void onInit() async {
    final homeWrapperController = Get.find<HomeWrapperController>();
    selectedStore = homeWrapperController.selectedStore;
    await getProductsByStore(homeWrapperController.selectedStore.id);
    super.onInit();
  }

  RxBool allProductsLoaded = false.obs;
  Future<List<Product>> getProductsByStore(int storeId,
      {int offset = 0}) async {
    if (offset == 5) {
      isLoading.value = true;
    }

    List<Product> newProducts = await apiService
        .getProductByStoreAndCollection(storeId, collectionId, offset: offset);
    if (newProducts.isEmpty) {
      allProductsLoaded.value = true;
    }
    if (offset == 0) {
      products.value = newProducts;
    } else {
      products.addAll(newProducts);
    }

    update();
    isLoading.value = false;
    return products;
  }

  @override
  onReady() {
    productViewScrollListener() async {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 250) {
        if (products.length > highestOffsetCalled) {
          highestOffsetCalled = products.length;
          await getProductsByStore(selectedStore.id, offset: products.length);
        }
      }
    }

    scrollController.addListener(productViewScrollListener);
    super.onReady();
  }

  int highestOffsetCalled = 0;
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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

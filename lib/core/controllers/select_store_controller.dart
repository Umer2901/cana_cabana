import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectStoreController extends GetxController{
   Rx<Store>? selectedStore;
   ScrollController scrollController = ScrollController();
  ScrollController productViewScrollController = ScrollController();
  List<Store> stores = [];

  String extractDate(String date) {
    int colonIndex = date.indexOf(':');
    if (colonIndex != -1) {
      String resultString = date.substring(colonIndex + 1).trim();
      return resultString;
    }
    return "Failed to extract hours";
    // Extract the substring starting from the character after the colon
  }
  RxList<Product> products = <Product>[].obs;
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
   
    super.onInit();
  }

  RxBool allProductsLoaded = false.obs;
  @override
  onReady() async {
    loadingStores.value = true;
    stores = await apiService.getStoreList();
    loadingStores.value = false;
    update();
 


    super.onReady();
  }

  @override
  void dispose() {
    productViewScrollController.dispose();
    super.dispose();
  }
}
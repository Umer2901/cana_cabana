import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/models/collection.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController collectionAnimationController;
  late Rx<Store> selectedStore;
  Collection? selectedCollection;
  RxList<Collection> collections = <Collection>[].obs;
  RxList<Collection> subCollections = <Collection>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    collectionAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    final homeWrapperController = Get.find<HomeWrapperController>();
    selectedStore = homeWrapperController.selectedStore.obs;
    collections.value =
        await apiService.getCollectionsByStore(selectedStore.value.id);
    isLoading.value = true;
    update();
   
  }
}

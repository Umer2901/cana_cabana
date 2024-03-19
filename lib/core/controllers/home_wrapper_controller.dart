import 'package:cana_cabana/core/controllers/profile_controller.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapperController extends GetxController {
  RxInt bottomBarIndex = 0.obs;
  PageController pageController = PageController();
  late Store selectedStore;
  @override
  void onInit() {
    final profileController = Get.find<ProfileController>();
    selectedStore = Get.arguments;
    super.onInit();
  }
}

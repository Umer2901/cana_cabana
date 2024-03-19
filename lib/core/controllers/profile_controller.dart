import 'dart:convert';

import 'package:cana_cabana/app/shared_prefs_keys.dart';
import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/models/user.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late User user;
  RxBool shouldUpdateUser = false.obs;
  @override
  void onInit() {
    super.onInit();
    final userString = sharedPrefsGlobal.getData(SharedPrefKeys.user);
    Map<String, dynamic> userJson = jsonDecode(userString);
    user = User.fromJson(userJson);
    firstNameController = TextEditingController(text: user.firstName);

    lastNameController = TextEditingController(text: user.lastName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber);
  }

  @override
  onReady() {
    super.onReady();
  }

  Future<void> onUpdatePressed() async {
    if (user.firstName == firstNameController.text &&
        user.lastName == lastNameController.text &&
        user.email == emailController.text &&
        user.phoneNumber == phoneNumberController.text) {
      showCustomDialog("No value changed", barrierDismissible: true);
      return;
    }
    showCustomDialog("Updating User Details",
        showLoading: true, barrierDismissible: false);
    final result = await apiService.updateUserDetails(
        firstNameController.text,
        lastNameController.text,
        phoneNumberController.text,
        emailController.text);
    Get.back();
    if (result is! bool) {
      showCustomDialog("An error occured please try again later",
          showLoading: false, barrierDismissible: true);
      return;
    }
    if (!result) {
      showCustomDialog("An error occured please try again later",
          showLoading: false, barrierDismissible: true);
      return;
    }
    showCustomDialog("Details updated successfully",
        showLoading: false, barrierDismissible: true);
    return;
  }

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;

  Sky selectedSegment = Sky.accountDetail;

  RxList<Category> categories = <Category>[
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
    Category(title: "Dried Flowers", isSelected: false),
  ].obs;
}

enum Sky { accountDetail, myOffers, favorites, membershipCard }

class Category {
  String title;
  bool isSelected;
  Category({required this.title, required this.isSelected});
}

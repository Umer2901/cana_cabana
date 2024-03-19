import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    showLoading();
    String email = emailController.text;
    String password = passwordController.text;

    final result = await apiService.login(email, password);
    if (result is bool) {
      if (result) {
        Get.back();
       Get.offAllNamed(AppRoute.selectStore);
      } else {
        Get.back();
        showCustomDialog(result as String, barrierDismissible: true);
      }
    } else {
      Get.back();
      showCustomDialog(result as String, barrierDismissible: true);
    }
  }
}

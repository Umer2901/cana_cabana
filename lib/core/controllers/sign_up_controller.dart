import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  RxString errorMessage = "".obs;
  Future<dynamic> signUp() async {
    final result = await apiService.signUp(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
      rePasswordController.text,
    );
    if (result == true) {
      return true;
    }
    errorMessage.value = result;
    showCustomDialog(errorMessage.value, barrierDismissible: true);
  }
}

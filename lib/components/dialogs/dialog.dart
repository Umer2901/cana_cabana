import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomDialog(
  String text, {
  bool barrierDismissible = true,
  bool showLoading = false,
}) {
  Get.dialog(
    Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLoading) const CupertinoActivityIndicator(),
            if (showLoading) const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: AppFont.montserratBold,
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: barrierDismissible,
  );
}

showLoading() {
  Get.dialog(
    Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

showLogoutDialog() {
  Get.dialog(
    Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: "Logout",
              width: Get.width * 0.6,
              onTap: () {
                sharedPrefsGlobal.deleteData();
                Get.offAllNamed(AppRoute.splashScreen);
              },
            )
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}

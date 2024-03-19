import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAddToCartDialog({bool failure = false}) {
  Get.dialog(Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50.0),
    child: Center(
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.pinkBg,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(failure ? AppImages.failure : AppImages.success),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Text(
              failure ? "Failed to add item" : "Added to Cart",
              style: const TextStyle(
                  fontSize: 27,
                  decoration: TextDecoration.none,
                  color: AppColors.primaryColor,
                  fontFamily: AppFont.montserrat,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: '30g ',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontFamily: AppFont.montserratBold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "max purchase. Total cart now contains ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.grey,
                      fontSize: 16,
                      fontFamily: AppFont.montserrat,
                    ),
                  ),
                  TextSpan(
                    text: '9.5g ',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontFamily: AppFont.montserratBold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'equivalency ',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.grey,
                      fontSize: 16,
                      fontFamily: AppFont.montserrat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    ),
  ));
}

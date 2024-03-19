import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/carousel.dart';
import 'package:cana_cabana/core/controllers/splash_screen_controller.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});
  final SplashScreenController controller = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Carousel(
              height: Get.height * 0.5,
              width: Get.width,
              carouselController: controller.carouselController,
              carouselImages: controller.carouselImages,
              showIndicators: false,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'UNBEATABLE',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 27,
                      fontFamily: AppFont.poppinsBold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' PRICES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: AppFont.poppinsBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                textAlign: TextAlign.center,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: Get.height * 0.13,
          left: Get.width * 0.1,
          right: Get.width * 0.1,
        ),
        child: CustomButton(
          text: "Get Started",
          onTap: () async {
            Get.offNamed(AppRoute.locationServices);
          },
        ),
      ),
    );
  }
}

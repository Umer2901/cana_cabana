import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/app/shared_prefs_keys.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/core/views/onboarding/age_verification.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            const SizedBox(height: 10),
            SvgPicture.asset(AppImages.unbeatablePrices),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: Get.height * 0.13,
              left: Get.width * 0.1,
              right: Get.width * 0.1),
          child: CustomButton(
            text: "Get Started",
            onTap: () {
              dynamic token =
                  sharedPrefsGlobal.getData(SharedPrefKeys.userToken);
              dynamic userData = sharedPrefsGlobal.getData(SharedPrefKeys.user);

              if ((token is String && token.length > 2)&&(userData is String)) {
                Get.offAllNamed(AppRoute.selectStore);
              } else {
                Get.to(() => const AgeVerificationScreen());
              }
            },
          )),
    );
  }
}

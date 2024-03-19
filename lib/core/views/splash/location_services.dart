import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/core/controllers/splash_screen_controller.dart';
import 'package:cana_cabana/ui/openingscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  final SplashScreenController controller = Get.find<SplashScreenController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Get.width * 0.03),
            child: InkWell(
              onTap: () {
                Get.offAll(() => const OpeningScreen());
              },
              child: Ink(
                color: Colors.transparent,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: AppFont.interBold,
                      fontSize: 17),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.06,
            ),
            SizedBox(
              height: Get.height * 0.65,
              child: PageView(
                onPageChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                controller: controller.pageController,
                children: [
                  LocationServices(),
                  NotificationService(),
                  const AppTrackingPermissionScreen()
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: Get.height * 0.01,
                dotWidth: Get.height * 0.01,
                radius: 30,
                activeDotColor: AppColors.darkDotColor,
                dotColor: AppColors.lightDotColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationServices extends StatelessWidget {
  LocationServices({super.key});
  final SplashScreenController controller = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        Image.asset(
          AppImages.locationServices,
          scale: 1.13,
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        const Text(
          "Location Services",
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFont.poppinsBold,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Text(
            'We use location services for delivery information. None of your location data is stored unless mentioned',
            textAlign: TextAlign.center,
            maxLines: 4,
            style: TextStyle(
              color: Colors.black.withOpacity(0.699999988079071),
              fontSize: 16,
              fontFamily: AppFont.inter,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        CustomButton(
          text: "Next",
          onTap: () async {
            await controller.determinePosition();

            controller.pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          },
          width: Get.width * 0.4,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              40,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
      ],
    );
  }
}

class NotificationService extends StatelessWidget {
  NotificationService({super.key});
  final SplashScreenController controller = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.notificationPermission,
          scale: 1.13,
        ),
        SizedBox(
          height: Get.height * 0.00,
        ),
        const Text(
          "TURN ON NOTIFICATIONS",
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFont.poppinsBold,
            fontSize: 27,
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Text(
            'Turn on notifications to stay up to date with the latest deals',
            textAlign: TextAlign.center,
            maxLines: 4,
            style: TextStyle(
              color: Colors.black.withOpacity(0.699999988079071),
              fontSize: 16,
              fontFamily: AppFont.inter,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        CustomButton(
          text: "Next",
          onTap: () async {
            await controller.requestNotificationPermission();

            controller.pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          },
          width: Get.width * 0.4,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              40,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
      ],
    );
  }
}

class AppTrackingPermissionScreen extends StatelessWidget {
  const AppTrackingPermissionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller =
        Get.find<SplashScreenController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.notificationPermission,
          scale: 1.4,
        ),
        SizedBox(
          height: Get.height * 0.00,
        ),
        const Text(
          "YOUR PREFERENCE",
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFont.poppinsBold,
            fontSize: 27,
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Text(
            'We track data to personalize your experience',
            textAlign: TextAlign.center,
            maxLines: 4,
            style: TextStyle(
              color: Colors.black.withOpacity(0.699999988079071),
              fontSize: 16,
              fontFamily: AppFont.inter,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        CustomButton(
          text: "Next",
          onTap: () async {
            await controller.requestTrackingInformation();
            Get.offAll(() => const OpeningScreen());
          },
          width: Get.width * 0.4,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              40,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
      ],
    );
  }
}

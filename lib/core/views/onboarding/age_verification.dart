import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AgeVerificationScreen extends StatefulWidget {
  const AgeVerificationScreen({super.key});

  @override
  State<AgeVerificationScreen> createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  DateTime myDateTime = DateTime.now();

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
            SizedBox(height: Get.height * 0.03),
            const Text(
              "Age Verification",
              style: TextStyle(
                fontFamily: AppFont.montserratBold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.activeBlue
                                              .resolveFrom(context)),
                                    ))
                              ],
                            ),
                            Expanded(
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (time) {
                                    myDateTime = time;
                                    setState(() {});
                                  }),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  DateFormat('d MMMM, y').format(myDateTime),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontFamily: AppFont.montserratBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: CustomButton(
                text: "Next",
                onTap: () {
                  if (!isAbove18(myDateTime)) {
                    showBanner("This app is restricted to people above 18",
                        barrierDismissible: true);
                  } else {
                    Get.offNamed(AppRoute.getStarted);
                  }
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

bool isAbove18(DateTime birthDate) {
  DateTime now = DateTime.now();
  DateTime eighteenYearsAgo = now.subtract(const Duration(days: 18 * 365));

  return birthDate.isBefore(eighteenYearsAgo);
}

showBanner(
  String text, {
  bool barrierDismissible = false,
  bool showLoading = false,
}) {
  Get.dialog(
    Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
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
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: AppFont.montserratBold),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: barrierDismissible,
  );
}

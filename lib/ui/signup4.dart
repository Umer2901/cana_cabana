import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/core/controllers/sign_up_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/profile/profile.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/ui/otp2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup4 extends StatelessWidget {
  const Signup4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTabletDevice(context) ? Get.width * 0.07 : 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFieldWithHeading(
                        heading: "Email",
                        hintText: "Email",
                        textColor: AppColors.darkDotColor,
                        controller: controller.emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWithHeading(
                        heading: "First Name",
                        hintText: "First Name",
                        textColor: AppColors.darkDotColor,
                        controller: controller.firstNameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWithHeading(
                        heading: "Last Name",
                        hintText: "Last Name",
                        textColor: AppColors.darkDotColor,
                        controller: controller.lastNameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextFieldWithHeading(
                        heading: "Phone Number (Optional)",
                        hintText: "Phone Number",
                        textColor: AppColors.darkDotColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWithHeading(
                        heading: "Create a password",
                        hintText: "Password",
                        textColor: AppColors.darkDotColor,
                        controller: controller.passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWithHeading(
                        heading: "Confirm Password",
                        hintText: "Confirm Password",
                        textColor: AppColors.darkDotColor,
                        controller: controller.rePasswordController,
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(400, 50),
                        ),
                        onPressed: () async {
                          dynamic status = await controller.signUp();
                          if (status is bool && status == true) {
                            Get.offAllNamed(AppRoute.selectStore);
                          }
                        },
                        child: const Text('Sign Up'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isTabletDevice(BuildContext context) {
  double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  double screenWidth = MediaQuery.of(context).size.shortestSide;

  bool isTablet = devicePixelRatio < 2.0 && screenWidth > 600.0;

  return isTablet;
}

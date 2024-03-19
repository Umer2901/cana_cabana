import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/ui/login1.dart';
import 'package:cana_cabana/ui/signup4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                  height: 316,
                  width: 260,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/cannacabana-logo.png")),
                  )),
              const Text(
                "Explore the app",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Need To be swapped To all your\nCannabis and accessory needs \nat fingertips",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                  //shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(350, 50),
                ),
                onPressed: () {
                  Get.toNamed(AppRoute.login);
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  side: const BorderSide(color: Colors.black, width: 1),
                  //shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(350, 50),
                ),
                onPressed: () {
                  Get.toNamed(AppRoute.signUp);
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoute.selectStore);
                  },
                  child: const Text(
                    "Continue as guest",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: AppFont.montserratBold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

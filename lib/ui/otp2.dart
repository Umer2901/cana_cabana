import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class Otp2 extends StatelessWidget {
  const Otp2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
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
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "We’ve sent an SMS with an activation\n code to your phone +33 2 94 27 84 11",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              PinInputTextField(
                pinLength: 6,
                decoration: BoxLooseDecoration(
                  strokeWidth: 1,
                  strokeColorBuilder: PinListenColorBuilder(
                    Colors.black, // Default border color
                    Colors.black, // Border color when focused
                  ),
                ),
                controller: TextEditingController(),
                autoFocus: true,
                textInputAction: TextInputAction.done,
                onSubmit: (pin) {
                  // Handle submitted PIN
                  if (kDebugMode) {
                    print(pin);
                  }
                },
              ),
              const SizedBox(
                height: 20,
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
                onPressed: () {
                  Get.offAllNamed(AppRoute.homeWrapper);
                },
                child: const Text('Log In'),
              ),
              const SizedBox(
                height: 250,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Send code again"),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "00:20",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      //decorationThickness: 2
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

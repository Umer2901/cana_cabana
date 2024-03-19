import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class Forget2 extends StatelessWidget {
  const Forget2({
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
                "Please check your\nemail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "We’ve sent a code to helloworld@gmail.com",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              PinInputTextField(
                pinLength: 4,
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
              ),
              const SizedBox(
                height: 10,
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
                onPressed: () {},
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

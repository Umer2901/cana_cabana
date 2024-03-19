import 'package:flutter/material.dart';

class Forget3 extends StatelessWidget {
  const Forget3({
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
                "Reset password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Please type something you’ll remember",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "New Password",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Confirm Password",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Confirm Password',
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined)),
                ),
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
                onPressed: () {},
                child: const Text('Reset Password'),
              ),
              const SizedBox(
                height: 190,
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
                        // decoration: TextDecoration.underline,
                        //decorationThickness: 2
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

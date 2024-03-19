import 'package:flutter/material.dart';

class Forget4 extends StatelessWidget {
  const Forget4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/stars.png")),
              const Text(
                "Password changed",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Your password has been changed \nsuccesfully",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
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
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

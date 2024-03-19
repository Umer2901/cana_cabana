import 'package:flutter/material.dart';

class Otp1 extends StatelessWidget {
  const Otp1({super.key});

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
                "Log in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Please confirm your country code and\n enter your phone number.",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 7,
              ),
              const Row(
                children: [
                  Icon(Icons.flag),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "France",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "+33",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30,
                        width: 200,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          // decoration: InputDecoration(
                          //   // border: InputBorder.none,
                          //   hintText: '00000',
                          //   hintStyle: TextStyle(color: Colors.grey),
                          // ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
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
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

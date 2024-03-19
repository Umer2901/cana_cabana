import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              Center(
                child: SizedBox(
                    height: 100,
                    width: 208,
                    child: Image.asset("assets/images/unbeatablelogo.png")),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 215, 215),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: ToggleSwitch(
                      minWidth: 172.0,
                      minHeight: 45.0,
                      cornerRadius: 20.0,
                      activeBgColors: const [
                        [Colors.red],
                        [Colors.red]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: const Color.fromARGB(255, 217, 215, 215),
                      inactiveFgColor: Colors.black,
                      labels: const ['Account Detail', 'My Favorite'],
                      customTextStyles: const [
                        TextStyle(fontWeight: FontWeight.bold)
                      ],
                      totalSwitches: 2,
                      onToggle: (index) {
                        if (kDebugMode) {
                          print('switched to: $index');
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Full Name",
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
                    hintText: 'Your Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email Address",
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
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Phone",
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
                    hintText: 'Your Phone',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Create a Password",
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
                height: 20,
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
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(400, 50),
                ),
                onPressed: () {},
                child: const Text(
                  'Enter Verification Code',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF124069),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Update to Elite',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "By using this application, you are agreeing to our terms & conditions and privacy policy",
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/core/controllers/login_controller.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  // Container(
                  //   height: 40,
                  //   width: 40,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     boxShadow: const <BoxShadow>[
                  //       BoxShadow(
                  //         color: Colors.black12,
                  //         blurRadius: 6.0,
                  //       )
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: const Icon(
                  //     Icons.arrow_back_ios_new_outlined,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Email address",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: controller.emailController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Email',
                          suffixIcon: const Icon(Icons.check_circle)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Password",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: controller.passwordController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Forgotten password?")],
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
                    onPressed: () async {
                     
                      await controller.login();

                    },
                    child: const Text('Log In'),
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign up",
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
        ),
      ),
    );
  }
}

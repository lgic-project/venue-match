import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/modules/auth/login_screen.dart';
import 'package:my_first_app/modules/auth/sign_up_screen.dart';
import 'package:my_first_app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  // WelcomeScreen({Key? key}) : super(key: key);

  double screenHeight = 0;
  double screenWidth = 0;

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 20),
                child: const Text(
                  "Sign in and plan your trip",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "By continuing, you accept our Terms of Use and Privacy Statement",
                  style: TextStyle(fontSize: 15)),
              const SizedBox(
                //gap haneko
                height: 30,
              ),
              InkWell(
                  onTap: () => Get.to(() => LoginScreen()),
                  child: CustomButton(
                    screenWidth: screenWidth,
                    label: "Log in",
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  )),
              const SizedBox(
                  //gap haneko
                  height: 20),
              const Text(
                "Don't you have an account? Register in a convenient way.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              InkWell(
                  onTap: () => Get.to(() => SignUpScreen()),
                  child: CustomButton(
                    screenWidth: screenWidth,
                    label: "Register with email",
                    textColor: primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

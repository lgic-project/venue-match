import 'package:flutter/material.dart';
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
                height: 50,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: CustomButton(
                    screenWidth: screenWidth,
                    label: "Log in",
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  )),
              const SizedBox(
                //gap haneko
                height: 50,
              ),
              const Align(child: Text("Don't you have an account?")),
              const Align(child: Text("Register in a convenient way")),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
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

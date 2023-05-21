// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venue_match/constant.dart';
import 'package:venue_match/auth/login_controller.dart';
import 'package:venue_match/widgets/custom_button.dart';
import 'package:venue_match/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(LoginController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //yesma rakhni background image chaii
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, //yo text laii aagadhi lagna use gareko ani column ko row jasto ma fixed garna cross hunxa aafnaii chaii main hunxa

                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight / 30),
                    child: Align(
                        child: Text(
                      "Log in ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ), //bold garna use gareko ani tyo paxadi ko f chaii attributes vara capital va
                  const SizedBox(
                    height: 40,
                  ),

                  const Text(
                    "Welcome to our Travel App",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 122, 119, 119)),
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    icon: Icons.person_outline,
                    label: "Enter your email",
                    border: null,
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    label: "Enter your Password",
                    border: null,
                    controller: controller.passwordController,
                  ),

                  SizedBox(height: 50),
                  InkWell(
                      onTap: controller.login,
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Continue",
                        textColor: Colors.white,
                        backgroundColor: primary,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      child: const Text(
                    "or",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 75, 73, 73)),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Spacer(),yo chaii button laii last ma purauna gareko ho
                  InkWell(
                    onTap: () {
                      // Get.off(SignUpScreen());
                    },
                    child: CustomButton(
                      screenWidth: screenWidth,
                      label: "Sign up",
                      textColor: Color.fromARGB(255, 241, 240, 240),
                      backgroundColor: primary,
                    ),
                  ),
                ]),
          ),
        ));
  }
}

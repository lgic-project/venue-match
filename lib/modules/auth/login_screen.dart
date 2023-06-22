// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/auth/login_controller.dart';
import 'package:my_first_app/modules/auth/sign_up_screen.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;

  LoginScreen({super.key});

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
                    hint: "Enter your email",
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    hint: "Enter your Password",
                    controller: controller.passwordController,
                  ),

                  SizedBox(height: 50),
                  InkWell(
                      onTap: controller.login,
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Continue",
                        textColor: Colors.white,
                        backgroundColor: primaryColor,
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
                      Get.off(SignUpScreen());
                    },
                    child: CustomButton(
                      screenWidth: screenWidth,
                      label: "Sign up",
                      textColor: Color.fromARGB(255, 241, 240, 240),
                      backgroundColor: primaryColor,
                    ),
                  ),
                ]),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/modules/auth/login_screen.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

import '../../data/controller/auth/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(SignupController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //yesma rakhni background image chaii
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, //yo text laii aagadhi lagna use gareko ani column ko row jasto ma fixed garna cross hunxa aafnaii chaii main hunxa

                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight / 30),
                      child: Align(
                          child: const Text(
                        "Sign up ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ), //bold garna use gareko ani tyo paxadi ko f chaii attributes vara capital va
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Sign up with Email",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 19, 18, 18)),
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      icon: Icons.person_outline,
                      label: "Enter your name",
                      border: null,
                      controller: controller.firstNameController,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.person_outline,
                      label: "Enter your last name",
                      border: null,
                      controller: controller.lastNameController,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.person_outline,
                      label: "Enter your email address",
                      border: null,
                      controller: controller.emailController,
                    ),
                    SizedBox(height: 10),

                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: "Enter your Password",
                      border: null,
                      controller: controller.passwordController,
                    ),

                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Back",
                        textColor: Color.fromARGB(255, 241, 240, 240),
                        backgroundColor: primary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: controller.signUp,
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Continue",
                        textColor: Color.fromARGB(255, 241, 240, 240),
                        backgroundColor: primary,
                      ),
                    ),
                    SizedBox(height: 20),
                  ]),
            ),
          ),
        ));
  }
}

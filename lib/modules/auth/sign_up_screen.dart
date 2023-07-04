import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/auth/signup_controller.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;

  SignUpScreen({super.key});

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
                      child: const Align(
                          child: Text(
                        "Sign up ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ), //bold garna use gareko ani tyo paxadi ko f chaii attributes vara capital va
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Sign up with Email",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 19, 18, 18)),
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      icon: Icons.person_outline,
                      hint: "Enter your first name",
                      controller: controller.firstNameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.person_outline,
                      hint: "Enter your last name",
                      controller: controller.lastNameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.person_outline,
                      hint: "Enter your email address",
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      icon: Icons.lock_outline,
                      hint: "Enter your Password",
                      controller: controller.passwordController,
                    ),

                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Back",
                        textColor: const Color.fromARGB(255, 241, 240, 240),
                        backgroundColor: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: controller.signUp,
                      child: CustomButton(
                        screenWidth: screenWidth,
                        label: "Continue",
                        textColor: const Color.fromARGB(255, 241, 240, 240),
                        backgroundColor: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]),
            ),
          ),
        ));
  }
}

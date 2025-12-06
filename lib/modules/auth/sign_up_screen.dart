import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/auth/signup_controller.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

class CustomSelectUserTypeWidget extends StatelessWidget {
  final String? title, userType, desc;
  final Function()? onTap;

  const CustomSelectUserTypeWidget({
    Key? key,
    this.title,
    this.onTap,
    this.desc,
    this.userType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (_) {
      return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
            border: Border.all(
              width: .6,
              color: _.userType == userType ? primaryColor : Colors.black38,
            ),
          ),
          width: appWidth / 2,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color:
                        _.userType == userType ? primaryColor : Colors.black38,
                    width: 1.5,
                  ),
                ),
                width: 14,
                height: 14,
                child: _.userType == userType
                    ? const Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 10,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(width: 10),
              Text(title ?? '')
            ],
          ),
        ),
      );
    });
  }
}

class SignUpScreen extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //yesma rakhni background image chaii
        body: SafeArea(
          child: GetBuilder<SignupController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, //yo text laii aagadhi lagna use gareko ani column ko row jasto ma fixed garna cross hunxa aafnaii chaii main hunxa

                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Sign up with Email",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 19, 18, 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      icon: Icons.person_outline,
                      hint: "Enter your first name",
                      controller: _.firstNameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.person_outline,
                      hint: "Enter your last name",
                      controller: _.lastNameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.email_outlined,
                      hint: "Enter your email address",
                      controller: _.emailController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      icon: Icons.lock_outline,
                      hint: "Enter your Password",
                      isPassword: true,
                      controller: _.passwordController,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Choose your Account Type',
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        for (int i = 0; i < (_.userTypeList.length); i++) ...[
                          Expanded(
                            child: CustomSelectUserTypeWidget(
                              onTap: () => _.setUserType(
                                  value: _.userTypeList[i].subHeading ?? ''),
                              userType: _.userTypeList[i].subHeading,
                              title: _.userTypeList[i].heading,
                            ),
                          ),
                          if (i == 0) ...[const SizedBox(width: 10)],
                        ],
                      ],
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: _.signUp,
                      child: CustomButton(
                        screenWidth: appWidth,
                        label: "Continue",
                        textColor: const Color.fromARGB(255, 241, 240, 240),
                        backgroundColor: primaryColor,
                      ),
                    ),
                  ]),
            );
          }),
        ));
  }
}

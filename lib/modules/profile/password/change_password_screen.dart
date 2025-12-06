import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

import '../../../data/controller/profile/profile_controller.dart';
import '../../../widgets/custom_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Change Password",
      ),
      body: GetBuilder<ProfileController>(initState: (state) {
        ProfileController.controller.clearFields(isForProfile: false);
      }, builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                icon: Icons.lock_outline,
                controller: _.currentPassController,
                hint: "Enter your Current password",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                icon: Icons.lock_outline,
                controller: _.newPassController,
                isPassword: true,
                hint: "Enter your new password",
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  if (_.currentPassController.text.isEmpty ||
                      _.newPassController.text.isEmpty) {
                    Get.rawSnackbar(
                        message: "Invalid!!! Empty fields",
                        backgroundColor: primaryColor);
                  } else {
                    _.changePassword();
                  }
                },
                child: CustomButton(
                  label: "Change password",
                  screenWidth: appWidth,
                  backgroundColor: primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

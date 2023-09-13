import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_first_app/data/controller/auth/signup_controller.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final TextEditingController controller;
  final bool? hasBorder, isFilled, isPassword;
  final bool readOnly;

  const CustomTextField(
      {super.key,
      this.hint,
      required this.icon,
      this.hasBorder = true,
      this.isFilled = false,
      this.readOnly = false,
      this.isPassword = false,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(initState: (state) {
      SignupController.controller.hidePass = false;
    }, builder: (_) {
      return TextField(
        controller: controller,
        readOnly: readOnly,
        obscureText: isPassword == true ? !_.hidePass : false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          filled: isFilled,
          fillColor: lightColor,
          prefixIcon: Icon(
            icon,
            size: 18,
          ),
          suffixIcon: isPassword == true
              ? GestureDetector(
                  onTap: _.changePasswordStatus,
                  child: Icon(
                    _.hidePass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 18,
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  hasBorder == true ? const BorderSide() : BorderSide.none),
        ),
      );
    });
  }
}

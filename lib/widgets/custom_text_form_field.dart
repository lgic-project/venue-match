import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormField extends StatelessWidget {
  IconData icon;
  String hint;
  TextEditingController controller;
  bool? hasBorder, isFilled;
  bool readOnly;
  Function()? onTap;

  CustomTextFormField(
      {super.key,
      required this.hint,
      required this.icon,
      this.onTap,
      this.hasBorder = true,
      this.isFilled = false,
      this.readOnly = false,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                hasBorder == true ? const BorderSide() : BorderSide.none),
      ),
    );
  }
}

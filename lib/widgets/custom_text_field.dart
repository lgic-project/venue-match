import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  IconData icon;
  String hint;
  TextEditingController controller;
  bool? hasBorder, isFilled;

  CustomTextField(
      {super.key,
      required this.hint,
      required this.icon,
      this.hasBorder = true,
      this.isFilled = false,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

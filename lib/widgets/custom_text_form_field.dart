import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormField extends StatelessWidget {
  IconData icon;
  String hint;
  TextEditingController controller;
  bool? hasBorder, isFilled;
  bool readOnly;
  Function()? onTap;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  Function? validator;

  CustomTextFormField(
      {super.key,
      required this.hint,
      required this.icon,
      this.onTap,
      this.keyboardType,
      this.hasBorder = true,
      this.isFilled = false,
      this.readOnly = false,
      this.textInputAction,
      this.validator,
      this.onChanged,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: (value) {
        return validator == null ? null : validator!(value);
      },
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

import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomTextField extends StatelessWidget {
  IconData icon;
  String label;
  TextEditingController controller;

  CustomTextField(
      {required this.label,
      required this.icon,
      required border,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          // label: Text("Phone Number"),
          hintText: label,
          prefixIcon: Icon(
            icon,
            color: primary,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}

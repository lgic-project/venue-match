import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venue_match/data/api/auth_api.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //regex expression for email and password
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<void> signUp() async {
    // taking the values
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // validation part
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      Get.rawSnackbar(
        message: "Invalid email pattern",
      );
      return;
    }

    if (!regex.hasMatch(password)) {
      Get.rawSnackbar(
          message:
              "Enter Valid password!!\nPassword must contain atleast 8 characters with one Small and Capital Letter.");
      return;
    }

    try {
      var response = await AuthApi.signUp(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);

      if (response.error != null && response.error == false) {
        Get.rawSnackbar(message: "You are successfully registered");
        //Get.off(() => LoginScreen());
      } else {
        Get.rawSnackbar(message: response.message);
      }
    } catch (e) {
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

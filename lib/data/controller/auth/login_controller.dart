import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/data/api/auth_api.dart';
import 'package:my_first_app/data/controller/app_controller.dart';
import 'package:my_first_app/modules/home/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.find<AppController>();

  //regex expression for email and password
  // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<void> login() async {
    print(controller.getToken());

    // taking the values
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // validation part
    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      Get.rawSnackbar(
        message: "Invalid email pattern",
      );
      return;
    }

    try {
      var response = await AuthApi.login(
        email: email,
        password: password,
      );

      if (response.error != null && response.error == false) {
        Get.rawSnackbar(message: "You are successfully logged in");
        controller.isLoggedIn(true);
        Get.off(() => const HomeScreen());
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

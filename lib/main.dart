import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/app_controller.dart';
import 'package:my_first_app/constant.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'modules/home/home_screen.dart';

import 'modules/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPref)); //myapp lai call gareko
}

class MyApp extends StatelessWidget {
  SharedPreferences sharedPreferences;
  MyApp(this.sharedPreferences, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:
          false, //side ko debug ko banner hatauna lai use gareko
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primary),
      ),

      initialBinding: BindingsBuilder(
        () {
          Get.put(AppController(sharedPreferences), permanent: true);
        },
      ),
      home: GetX<AppController>(
          init: AppController(sharedPreferences),
          builder: (controller) => controller.isLoggedIn.isFalse
              ? WelcomeScreen()
              : const Homescreen()),
    );
  }
}

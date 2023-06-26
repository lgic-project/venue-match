import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  static AppController controller = Get.find();
  final SharedPreferences sharedPreferences;
  final isLoggedIn = false.obs; //obs le chai observable
  //observable ko value chai tmle app through access grna milyo
  // bool isLog = true;

  AppController(this.sharedPreferences) {
    String? apiKey = sharedPreferences.getString('apiKey');

    if (apiKey == null || apiKey == "") {
      isLoggedIn(false); //isLoggedIn = true;
    } else {
      isLoggedIn(true);
    }
  }

  String getToken() {
    return sharedPreferences.getString('apiKey') ?? '';
  }
}

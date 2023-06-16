import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/model/login_response.dart';
import 'package:http/http.dart' as http;

import '../controller/app_controller.dart';

class AuthApi {
  static Future<LoginResponse> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    const url = "${baseUrl}register";

    Map<String, String> requestBody = <String, String>{
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "COntent-Type": "application/x-www-form-urlencoded",
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('some of the fields are missing');
    } else {
      throw Exception("something went wrong");
    }
  }

  static Future<LoginResponse> login(
      {required String email, required String password}) async {
    const url = "${baseUrl}login";

    Map<String, String> requestBody = <String, String>{
      "email": email,
      "password": password,
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "COntent-Type": "application/x-www-form-urlencoded",
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('some of the fields are missing');
    } else {
      throw Exception("something went wrong");
    }
  }
}

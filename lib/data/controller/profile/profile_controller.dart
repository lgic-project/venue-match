import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_app/data/model/user_model.dart';

import '../../../constant.dart';
import '../app_controller.dart';

class ProfileController extends GetxController {
  static final ProfileController controller = Get.find();
  bool isLoading = false;
  String? errorMessage;

  var userData = UserModel();
  ImagePicker imagePicker = ImagePicker();
  XFile? profilePic;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var currentPassController = TextEditingController();
  var newPassController = TextEditingController();

  String? profileImage;

  Future changePassword() async {
    try {
      var url = '${baseUrl}change-password';
      Map<String, String> data = {
        'new_password': newPassController.text,
        'current_password': currentPassController.text,
      };
      log(newPassController.text);
      log(currentPassController.text);
      final response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "api_key": AppController.controller.getToken(),
        },
      );

      var authorizationResponse =
          UserModel.fromJson(json.decode(response.body));
      if (authorizationResponse.error != null &&
          authorizationResponse.error == false) {
        clearFields(isForProfile: false);
        getUserData();
        Get.back();
        Get.rawSnackbar(message: "Password changed successfully");
      } else {
        Get.rawSnackbar(message: authorizationResponse.message);
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

  clearFields({bool? isForProfile = true}) {
    if (isForProfile == true) {
      profilePic = null;
      profileImage = "";
      firstNameController.clear();
      lastNameController.clear();
    } else {
      currentPassController.clear();
      newPassController.clear();
    }
  }

  void getImage() async {
    profilePic = await imagePicker.pickImage(source: ImageSource.gallery);
    profileImage = null;
    update();
  }

  Future getUserData() async {
    try {
      isLoading = true;
      var url = "${baseUrl}user-data";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'api_key': AppController.controller.getToken(),
        },
      );
      userData = UserModel.fromJson(json.decode(response.body));
      firstNameController.text = userData.firstname ?? '';
      lastNameController.text = userData.lastname ?? '';
      profileImage = userData.profilePic;
      isLoading = false;
      update();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load venues";
      }
      errorMessage = e.toString();
    }
  }

  Future udpateProfile() async {
    try {
      var url = '${baseUrl}update-profile';

      Map<String, String> payload = {
        'firstname': firstNameController.text,
        'lastname': lastNameController.text,
      };

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        "Content-Type": "application/form-data",
        "api_key": AppController.controller.getToken(),
      });

      profilePic == null
          ? null
          : request.files.add(
              await http.MultipartFile.fromPath(
                "image",
                profilePic?.path ?? '',
                contentType: MediaType(
                  'image',
                  'jpg',
                ),
              ),
            );

      request.fields.addAll(payload);
      var data = await request.send();
      var response = await http.Response.fromStream(data);

      var profileResponse = UserModel.fromJson(json.decode(response.body));
      if (profileResponse.error != null && profileResponse.error == false) {
        clearFields();
        getUserData();
        Get.back();
        Get.rawSnackbar(message: "User Details updated successfully");
      } else {
        Get.rawSnackbar(message: profileResponse.message);
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
}

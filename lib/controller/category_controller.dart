import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_first_app/constant.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/data/model/category.dart';

class CategoryController extends GetxController {
  static CategoryController controller = Get.find();
  bool isLoading = false;
  var categoriesList = <Categories>[];
  String errorMessage = '';
  getCategories() async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-categories";
      final response = await http.get(Uri.parse(url));
      categoriesList =
          CategoryModel.fromJson(json.decode(response.body)).categories ?? [];
      update();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load products";
      }
      errorMessage = e.toString();
    }
  }
}

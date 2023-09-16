import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/model/category.dart';
import 'package:my_first_app/data/model/venue_model.dart';

class CategoryController extends GetxController {
  static CategoryController controller = Get.find();
  bool isLoading = false;
  var categoriesList = <Categories>[];
  var venuesRelatedToCategoryList = <Venues>[];
  String errorMessage = '';

  getCategories() async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-categories";
      final response = await http.get(Uri.parse(url));
      isLoading = false;
      categoriesList =
          CategoryModel.fromJson(json.decode(response.body)).categories ?? [];
      update();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load categories";
      }
      errorMessage = e.toString();
    }
  }

  getVenuesByCategory({String? categoryId}) async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-venues-by-category?category_id=$categoryId";
      final response = await http.get(
        Uri.parse(url),
      );
      isLoading = false;
      venuesRelatedToCategoryList =
          VenueModel.fromJson(json.decode(response.body)).venues ?? [];
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
}

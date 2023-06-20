import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_first_app/data/model/venue_model.dart';
import 'package:http/http.dart' as http;
import '../../../constant.dart';

class VenueController extends GetxController {
  static VenueController controller = Get.find();
  bool isLoading = false;
  var venuesList = <Venues>[];
  var singleVenueList = <Venues>[];
  String errorMessage = '';

  getVenues({String? id}) async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-venues${id != null ? '?venue_id=$id' : ''}";
      final response = await http.get(Uri.parse(url));
      if (id != null) {
        singleVenueList =
            VenueModel.fromJson(json.decode(response.body)).venues ?? [];
      } else {
        venuesList =
            VenueModel.fromJson(json.decode(response.body)).venues ?? [];
      }
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

  String getDishes({bool isForVeg = true}) {
    var dishes = singleVenueList.first.dishes;
    var vegDishList = [];
    var nonVegDishList = [];
    for (int i = 0; i < (dishes?.length ?? 1); i++) {
      if (dishes?[i].dishType?.toLowerCase() == 'veg') {
        vegDishList.add(dishes?[i].dishName);
      } else {
        nonVegDishList.add(dishes?[i].dishName);
      }
    }
    return isForVeg ? vegDishList.join('\n') : nonVegDishList.join('\n');
  }
}

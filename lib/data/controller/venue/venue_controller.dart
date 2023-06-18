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
      // String endUrl = "";
      // if (id != null) {
      //   endUrl = "/venue_id=$id";
      // } else {
      //   endUrl = "";
      // }
      var url = "${baseUrl}get-venues${id != null ? '?venue_id=$id' : ''}";
      final response = await http.get(Uri.parse(url));
      isLoading = false;
      if (id != null) {
        singleVenueList =
            VenueModel.fromJson(json.decode(response.body)).venues ?? [];
      } else {
        venuesList =
            VenueModel.fromJson(json.decode(response.body)).venues ?? [];
      }
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

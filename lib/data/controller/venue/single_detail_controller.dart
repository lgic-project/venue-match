import 'package:get/get.dart';

import '../app_controller.dart';

class SingleVenueController {
  final count = 1.obs;
  String apiKey =
      Get.find<AppController>().sharedPreferences.getString('apikey') ?? "";

  //to decreaset the quantity value in each plant screen
  void decrement() {
    if (count.value > 1) {
      count.value--; //count(2);
    }
  }

  void increment() {
    count.value++;
  }

  Future<void> addToCart(int venueId) async {
    // Get.find<CartController>().addToCart(plantId, count.value.toString());
  }
}

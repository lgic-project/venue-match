import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_app/data/controller/category/category_controller.dart';

import '../../../constant.dart';
import '../../model/user_model.dart';
import '../../model/venue_model.dart';
import '../../model/venue_owner_venue_model.dart';
import '../app_controller.dart';

class VenueOwnerController extends GetxController {
  static final VenueOwnerController controller = Get.find();
  bool isLoading = false;
  String? errorMessage;
  var userSingleVenueList = <Venues>[];

  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();
  var capacityController = TextEditingController();
  String? categoryId, venueImage;
  ImagePicker imagePicker = ImagePicker();
  XFile? venueImageFile;
  final GlobalKey<FormState> _venueFormKey = GlobalKey<FormState>();

  String? venueId;

  List<VenueOwnerVenues> userAllVenuesList = [];

  GlobalKey<FormState> get venueFormKey => _venueFormKey;

  Future addUpdateVenue({bool? isForUpdate = false}) async {
    try {
      var url = '${baseUrl}upload-venue';

      Map<String, String> payload = {
        'name': nameController.text,
        'price': priceController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'capacity': capacityController.text,
        'category_id': isForUpdate == true
            ? categoryId ?? ''
            : CategoryController.controller.categoriesList.first.id.toString(),
        "isForUpdate": isForUpdate.toString(),
        "venue_id": venueId ?? '',
      };
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        "Content-Type": "application/form-data",
        "api_key": AppController.controller.getToken(),
      });

      venueImageFile == null
          ? null
          : request.files.add(
              await http.MultipartFile.fromPath(
                "image",
                venueImageFile?.path ?? '',
                contentType: MediaType(
                  'image',
                  'jpg',
                ),
              ),
            );

      request.fields.addAll(payload);
      var data = await request.send();
      var response = await http.Response.fromStream(data);
      var venueResponse = UserModel.fromJson(json.decode(response.body));

      log(request.toString());
      if (venueResponse.error != null && venueResponse.error == false) {
        if (isForUpdate == true) {
          getSingleVenueByUser(id: venueId);
        } else {
          getAllVenuesByUser();
        }
        clearFields();
        Get.back();
        Get.rawSnackbar(message: venueResponse.message);
        update();
      } else {
        Get.rawSnackbar(message: venueResponse.message);
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

  clearFields() {
    nameController.clear();
    priceController.clear();
    locationController.clear();
    descriptionController.clear();
    capacityController.clear();
    categoryId = null;
    venueImage = null;
    venueImageFile = null;
    venueId = null;
  }

  getAllVenuesByUser() async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-all-venues-by-user";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'api_key': AppController.controller.getToken(),
        },
      );
      userAllVenuesList =
          VenueOwnerVenueModel.fromJson(json.decode(response.body)).venues ??
              [];
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

  void getImage() async {
    venueImageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    venueImage = null;
    update();
  }

  getSingleVenueByUser({String? id}) async {
    try {
      isLoading = true;
      var url = "${baseUrl}get-single-venue-by-user?venue_id=$id";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'api_key': AppController.controller.getToken(),
        },
      );
      userSingleVenueList =
          VenueModel.fromJson(json.decode(response.body)).venues ?? [];
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

  String getVenueDishesByUser({bool isForVeg = true}) {
    var dishes = userSingleVenueList.first.dishes;
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

  initVenueDetails() {
    for (var e in userSingleVenueList) {
      nameController.text = e.name ?? '';
      priceController.text = e.price.toString();
      locationController.text = e.location ?? '';
      descriptionController.text = e.description ?? '';
      capacityController.text = e.capacity ?? '';
      categoryId = e.categoryId.toString();
      venueImage = e.image;
      venueId = e.id.toString();
    }
    update();
  }

  setCategoryDropdownValue(value) {
    categoryId = value;
  }
}

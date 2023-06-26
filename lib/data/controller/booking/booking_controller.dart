import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/app_controller.dart';
import 'package:my_first_app/data/model/login_response.dart';

import '../../../modules/booking/payment_success_screen.dart';
import '../../model/venue_model.dart';

class BookingController extends GetxController {
  static BookingController controller = Get.find();
  var bookingDateController = TextEditingController();
  var bookingPersonController = TextEditingController();
  DateTime? selectedDate;
  String? bookingPeopleNum;
  double? bookingTotalAmt;
  Venues? venuesList;
  String? ocassionId;
  final GlobalKey<FormState> _bookingFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get bookingFormKey => _bookingFormKey;

  checkBookingFields(BuildContext context) {
    if (bookingFormKey.currentState!.validate()) {
      if (bookingDateController.text.isNotEmpty) {
        if (ocassionId != null) {
          return proceedBooking(context);
        }
        return Get.rawSnackbar(
          message: 'Please select Ocassion',
          backgroundColor: secondaryColor,
          duration: const Duration(seconds: 1),
        );
      }
      return Get.rawSnackbar(
        message: 'Please select Booking Date',
        duration: const Duration(seconds: 1),
        backgroundColor: secondaryColor,
      );
    }
  }

  clearBookingFieldValues() {
    selectedDate = null;
    bookingPeopleNum = null;
    bookingTotalAmt = 0.0;
    ocassionId = null;
    bookingDateController.clear();
    bookingPersonController.clear();
  }

  onBookingPersonChanged() {
    if (bookingPersonController.text.isNotEmpty) {
      bookingPeopleNum = bookingPersonController.text;
      bookingTotalAmt = (venuesList?.price?.toDouble() ?? 0.0) *
          double.parse(bookingPersonController.text);
    } else {
      bookingPeopleNum = null;
      bookingTotalAmt = 0.0;
    }
    update();
  }

  @override
  void onClose() {
    bookingDateController.dispose();
    bookingPersonController.dispose();
    super.dispose();
  }

  proceedBooking(BuildContext context) {
    // double bookingPrice = double.parse(venuesList?.price.toString() ?? '0');
    // double totalAmount = double.parse(bookingTotalAmt.toString());
    Map data = {
      'bookingDate': bookingDateController.text,
      'bookingPeople': bookingPersonController.text,
      'categoryId': ocassionId,
      'venueId': venuesList?.id.toString(),
      'bookingPrice': venuesList?.price?.toString(),
      'totalAmount': bookingTotalAmt.toString(),
      'paymentMedium': 'Khalti',
    };

    var url = '${baseUrl}booking';
    // var requestBody = json.encode(data);

    final config = PaymentConfig(
      amount: bookingTotalAmt?.toInt() ?? 0, // Amount should be in paisa
      productIdentity: venuesList?.id.toString() ?? '',
      productName: venuesList?.name ?? '',
    );
    KhaltiScope.of(context).pay(
      config: config,
      preferences: const [
        // Not providing this will enable all the payment methods.
        PaymentPreference.khalti,
      ],
      onSuccess: (successModel) async {
        // Perform Server Verification
        try {
          var response = await http.post(Uri.parse(url), body: data, headers: {
            'api_key': AppController.controller.getToken(),
          });

          var jsonResp = LoginResponse.fromJson(json.decode(response.body));

          if (jsonResp.error != null && jsonResp.error == false) {
            Get.offAll(() => PaymentSucessScreen(
                  venuesList: venuesList,
                  bookedDate: bookingDateController.text,
                  person: bookingPersonController.text,
                  totalAmt: bookingTotalAmt,
                ));
          } else {
            Get.rawSnackbar(
              backgroundColor: primaryColor,
              message: jsonResp.message,
              duration: const Duration(seconds: 1),
            );
          }
        } catch (e) {
          String errorMessage;
          if (e.toString().contains("SocketException")) {
            errorMessage = "No Internet Connection";
          } else {
            errorMessage = e.toString();
          }
          Get.rawSnackbar(
            backgroundColor: Colors.green,
            message: errorMessage,
            duration: const Duration(seconds: 1),
          );
        }
      },
      onFailure: (failureModel) {
        // What to do on failure?
        Get.rawSnackbar(
          message: failureModel.message,
          backgroundColor: secondaryColor,
          duration: const Duration(seconds: 1),
        );
      },
      onCancel: () {
        // User manually cancelled the transaction
      },
    );
  }

  selectBookingDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((value) {
      if (value != null) {
        selectedDate = value;
        return bookingDateController.text = DateFormat('y-MM-dd').format(value);
      }
    });
  }

  setOcassionDropdownValue(value) {
    ocassionId = value;
  }
}

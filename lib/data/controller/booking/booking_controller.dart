import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  var bookingDateController = TextEditingController();
  var bookingPersonController = TextEditingController();

  selectBookingDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((value) {
      if (value != null) {
        //   if (isForInvoiceDate) {
        //     if (DateTime.parse(addPurchaseDueDateController.text)
        //         .isBefore(value)) {
        //       addPurchaseDueDateController.text =
        //           DateTimeFormat.dateFormat(DateTime.now());
        //     }
        //     return addPurchaseInvoiceDateController.text =
        //         DateTimeFormat.dateFormat(value);
        //   }
        return bookingDateController.text = DateFormat('y-MM-dd').format(value);
      }
    });
  }
}

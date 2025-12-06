import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/booking/booking_controller.dart';
import 'package:my_first_app/data/controller/category/category_controller.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';

import '../../data/model/venue_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../single_category/widgets/custom_venue_item_by_category_widget.dart';

class BookingScreen extends StatelessWidget {
  final Venues venues;
  final String? categoryId;

  const BookingScreen({
    super.key,
    required this.venues,
    this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(title: 'Booking'),
        body: GetBuilder<BookingController>(initState: (state) {
          BookingController.controller.clearBookingFieldValues();
          BookingController.controller.venuesList = venues;
        }, builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _.bookingFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVenueItemByCategoryWidget(venues: venues),
                  const SizedBox(height: 20),
                  Text(
                    "Date ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hint: "Booking date",
                    icon: Icons.calendar_month,
                    controller: _.bookingDateController,
                    isFilled: true,
                    readOnly: true,
                    hasBorder: false,
                    onTap: () => _.selectBookingDate(context),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Person",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hint: "Enter Person Number",
                    icon: Icons.person,
                    controller: _.bookingPersonController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _.onBookingPersonChanged(),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Person can not be Empty!";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Ocassion",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<CategoryController>(builder: (__) {
                    return DropdownButtonFormField(
                      hint: const Text('Select Ocassion'),
                      items: __.categoriesList
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item.id.toString(),
                              child: Text(
                                item.name ?? '',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          )
                          .toList(),
                      value: categoryId,
                      onChanged: (value) => _.setOcassionDropdownValue(value),
                      decoration: InputDecoration(
                        fillColor: lightColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Text(
                    "Price Details",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Price per Plate: ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Rs ${venues.price}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total No. of People: ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              _.bookingPeopleNum ?? '-',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Cost Detail: ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              (_.bookingPersonController.text.isEmpty)
                                  ? '-'
                                  : "Rs ${venues.price} * ${_.bookingPeopleNum}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Amount: ",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              (_.bookingPersonController.text.isEmpty)
                                  ? '-'
                                  : "${_.bookingTotalAmt}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                      onTap: () => _.checkBookingFields(context),
                      child: CustomButton(
                        screenWidth: appWidth,
                        label: "Continue with Khalti",
                        textColor: Colors.white,
                        backgroundColor: const Color(0xff5C2D90),
                        borderColor: const Color(0xff5C2D90),
                      )),
                ],
              ),
            ),
          );
        }));
  }
}

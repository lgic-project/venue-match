import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';

import '../../data/model/venue_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../single_category/widgets/custom_venue_item_by_category_widget.dart';

class BookingScreen extends StatelessWidget {
  final Venues venues;

  const BookingScreen({
    super.key,
    required this.venues,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(title: 'Booking'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
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
              CustomTextField(
                hint: "Start date",
                icon: Icons.calendar_month,
                controller: TextEditingController(),
                isFilled: true,
                hasBorder: false,
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
              CustomTextField(
                hint: "Person",
                icon: Icons.person,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              Text(
                "Price Details",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
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
                          "1000",
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
                          "Rs ${venues.price} * 1000",
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
                          "Rs 500000",
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
                  onTap: () {},
                  child: CustomButton(
                    screenWidth: appWidth,
                    label: "Continue",
                    textColor: Colors.white,
                    backgroundColor: primaryColor,
                  )),
            ],
          ),
        ));
  }
}

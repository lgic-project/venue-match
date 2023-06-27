import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/model/venue_model.dart';

import '../../widgets/custom_button.dart';
import '../home/home_screen.dart';

class PaymentSucessScreen extends StatelessWidget {
  final Venues? venuesList;
  final String? bookedDate, person;
  final double? totalAmt;
  const PaymentSucessScreen({
    super.key,
    this.venuesList,
    this.bookedDate,
    this.person,
    this.totalAmt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 100),
            Column(
              children: [
                Lottie.asset(
                  'assets/lottie/success.json',
                  width: appWidth / 2,
                  repeat: false,
                ),
                const SizedBox(height: 30),
                Text(
                  'Successful Place Rental',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'You have successfully rented your Venue, you can go there.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                            "Venue: ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${venuesList?.name}",
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
                            "Location: ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            venuesList?.location ?? '',
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
                            "Booked Date: ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            bookedDate ?? '',
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
                            "Person: ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            person ?? '',
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
                            totalAmt.toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Get.offAll(() => const HomeScreen()),
              child: CustomButton(
                screenWidth: appWidth,
                label: 'Back to home',
                backgroundColor: primaryColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

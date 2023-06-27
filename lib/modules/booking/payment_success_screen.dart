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
                
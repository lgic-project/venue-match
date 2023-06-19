import 'package:flutter/material.dart';
import 'package:my_first_app/constant.dart';

import '../../widgets/custom_button.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              child: Text(
                "Booking",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Date ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomTextField(
            //           label: "Start date",
            //           icon: Icons.calendar_month,
            //           border: null),
            //     ),
            //     SizedBox(width: 15),
            //     Expanded(
            //       child: CustomTextField(
            //         controller: ,
            //           label: "End date",
            //           icon: Icons.calendar_month,
            //           border: null),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 15),
            const Text(
              "Person ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(
              height: 70,
            ),
            const Text(
              "Price Details ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Travel fee: ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "1000*2 ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Discount: ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "100 ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total: ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "900 ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: () {},
                child: CustomButton(
                  screenWidth: screenWidth,
                  label: "Continue",
                  textColor: Colors.white,
                  backgroundColor: primary,
                )),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ));
  }
}

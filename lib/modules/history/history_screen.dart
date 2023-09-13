import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/booking/booking_controller.dart';

import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/custom_cached_network_image_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Booking History",
        hasLeadingWidget: false,
      ),
      body: GetBuilder<BookingController>(initState: (state) {
        BookingController.controller.getBookings();
      }, builder: (_) {
        if (_.bookingList.isEmpty) {
          return Center(
            child: Text(
              'You have not booked any venues',
              style: GoogleFonts.poppins(),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            var model = _.bookingList[index];
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _.bookingList[index].venues?.length,
              itemBuilder: (context, index2) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                          spreadRadius: 3,
                          color: Colors.grey.shade200,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomCachedNetworkImageWidget(
                              image: model.venues?[index2].image,
                              height: 90,
                              width: 100,
                              placeHolderHeight: 40,
                              placeHolderWidth: 40,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.bookedDate ?? '',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  model.venues?[index2].name?.trim() ?? '',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  model.venues?[index2].location?.trim() ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Booked Price : Rs ${model.totalAmount}",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Category : ${model.category}",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            child: Text(
                              "${model.paymentMedium}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
          itemCount: _.bookingList.length,
        );
      }),
    );
  }
}

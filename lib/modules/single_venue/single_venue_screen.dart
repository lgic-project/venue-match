import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/venue/venue_controller.dart';
import 'package:my_first_app/modules/booking/booking_screen.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_loading_widget.dart';

import '../../widgets/custom_cached_network_image_widget.dart';
import 'widgets/custom_dish_type_widget.dart';
import 'widgets/custom_venue_info_widget.dart';

class SingleVenueScreen extends StatelessWidget {
  final String? id, categoryId;
  final bool isFromCategory;
  var controller = VenueController.controller;
  SingleVenueScreen({
    super.key,
    this.id,
    this.categoryId,
    this.isFromCategory = false,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VenueController>(initState: (state) {
        controller.getVenues(id: id);
      }, builder: (_) {
        return SafeArea(
            child: _.isLoading
                ? const CustomLoadingWidget()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20,
                                            offset: const Offset(0, 5),
                                            spreadRadius: 5,
                                            color: Colors.black.withOpacity(.1),
                                          )
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      child: CustomCachedNetworkImageWidget(
                                        image: _.singleVenueList.first.image,
                                        width: appWidth,
                                        height: appHeight / 2.3,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 30,
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: const Icon(
                                          Icons.chevron_left,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _.singleVenueList.first.name
                                                        ?.trim() ??
                                                    '',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: primaryColor,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      _.singleVenueList.first
                                                              .location
                                                              ?.trim() ??
                                                          '',
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Rs ${_.singleVenueList.first.price ?? ''}",
                                            style: GoogleFonts.poppins(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        CustomVenueInfoWidget(
                                          icon: Icons.people_rounded,
                                          title:
                                              "${_.singleVenueList.first.capacity} People",
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              Dialog(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 25),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        CustomDishTypeWidget(
                                                          color: Colors.green,
                                                          title: 'Veg Dishes',
                                                          desc: _.getDishes(),
                                                        ),
                                                        CustomDishTypeWidget(
                                                          color: primaryColor,
                                                          title:
                                                              'Non Veg Dishes',
                                                          desc: _.getDishes(
                                                              isForVeg: false),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const CustomVenueInfoWidget(
                                            icon: Icons.local_dining_outlined,
                                            title: 'Catering',
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomVenueInfoWidget(
                                          // isSvg: true,
                                          // svgIcon:
                                          //     'assets/icons/status_booked.svg',
                                          icon: Icons.calendar_month,
                                          iconColor: _.singleVenueList.first
                                                      .bookingStatus ==
                                                  "booked"
                                              ? primaryColor
                                              : Colors.green,
                                          title: _.singleVenueList.first
                                                      .bookingStatus ==
                                                  "booked"
                                              ? "Booked"
                                              : "Available",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      _.singleVenueList.first.description ?? '',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap:
                              _.singleVenueList.first.bookingStatus == "booked"
                                  ? () {
                                      Get.rawSnackbar(
                                        backgroundColor: secondaryColor,
                                        message:
                                            "Sorry, this venue is already booked!!",
                                        duration: const Duration(seconds: 1),
                                      );
                                    }
                                  : () => Get.to(() => BookingScreen(
                                        venues: _.singleVenueList.first,
                                        categoryId: categoryId,
                                      )),
                          child: CustomButton(
                            screenWidth: appWidth,
                            label: "Book Now",
                            textColor: const Color.fromARGB(255, 241, 240, 240),
                            backgroundColor: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ));
      }),
    );
  }
}

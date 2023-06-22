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

class SingleVenueScreen extends StatelessWidget {
  SingleVenueScreen({
    super.key,
    this.id,
  });
  final String? id;
  var controller = VenueController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VenueController>(initState: (state) {
        controller.getVenues(id: id);
      }, builder: (_) {
        // var model =_.singleVenueList.first;
        // print(_.singleVenueList.first.id);
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
                          onTap: () => Get.to(() =>
                              BookingScreen(venues: _.singleVenueList.first)),
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

class CustomDishTypeWidget extends StatelessWidget {
  const CustomDishTypeWidget({
    super.key,
    this.title,
    this.desc,
    this.color,
  });

  final String? title, desc;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: color,
              size: 6,
            ),
            const SizedBox(width: 5),
            Text(
              title ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          desc ?? '',
          style: GoogleFonts.poppins(
            fontSize: 13,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class CustomVenueInfoWidget extends StatelessWidget {
  const CustomVenueInfoWidget({
    super.key,
    this.title,
    this.icon,
  });

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: primaryColor,
          size: 22,
        ),
        Text(
          "$title",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

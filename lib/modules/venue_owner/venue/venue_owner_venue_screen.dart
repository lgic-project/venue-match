import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/modules/venue_owner/add_venue/add_update_venue_screen.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';

import '../../../constant.dart';
import '../../../data/controller/venue owner/venue_owner_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_cached_network_image_widget.dart';
import '../../../widgets/custom_loading_widget.dart';
import '../../single_venue/widgets/custom_dish_type_widget.dart';
import '../../single_venue/widgets/custom_venue_info_widget.dart';

class VenueOwnerVenueScreen extends StatelessWidget {
  final String? venueId;
  const VenueOwnerVenueScreen({
    super.key,
    this.venueId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Your Venue Details",
        hasLeadingWidget: false,
      ),
      body: GetBuilder<VenueOwnerController>(
        initState: (state) {
          VenueOwnerController.controller.getSingleVenueByUser(id: venueId);
        },
        builder: (_) {
          return _.isLoading
              ? const CustomLoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(15),
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                borderRadius: BorderRadius.circular(8),
                                child: CustomCachedNetworkImageWidget(
                                  image: _.userSingleVenueList.first.image,
                                  width: appWidth,
                                  height: appHeight / 3,
                                ),
                              ),
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
                                              _.userSingleVenueList.first.name
                                                      ?.trim() ??
                                                  '',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Rs ${_.userSingleVenueList.first.price ?? ''}",
                                        style: GoogleFonts.poppins(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: primaryColor,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _.userSingleVenueList.first.location
                                                ?.trim() ??
                                            '',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      CustomVenueInfoWidget(
                                        icon: Icons.people_rounded,
                                        title:
                                            "${_.userSingleVenueList.first.capacity} People",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.dialog(
                                            Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 25),
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
                                                        desc: _
                                                            .getVenueDishesByUser(),
                                                      ),
                                                      CustomDishTypeWidget(
                                                        color: primaryColor,
                                                        title: 'Non Veg Dishes',
                                                        desc: _
                                                            .getVenueDishesByUser(
                                                                isForVeg:
                                                                    false),
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
                                    _.userSingleVenueList.first.description ??
                                        '',
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
                        onTap: () => Get.to(() => AddOrUpdateVenueScreen(
                            isForUpdate: true, venueId: venueId)),
                        child: CustomButton(
                          screenWidth: appWidth,
                          label: "Edit Details",
                          textColor: const Color.fromARGB(255, 241, 240, 240),
                          backgroundColor: primaryColor,
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

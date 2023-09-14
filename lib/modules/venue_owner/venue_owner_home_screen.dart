import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/modules/venue_owner/add_venue/add_update_venue_screen.dart';
import 'package:my_first_app/modules/venue_owner/venue/venue_owner_venue_screen.dart';

import '../../constant.dart';
import '../../data/controller/venue owner/venue_owner_controller.dart';
import '../../widgets/custom_app_bar_widget.dart';

class VenueOwnerHomeScreen extends StatelessWidget {
  const VenueOwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Venue Owner",
        hasLeadingWidget: false,
        hasTrailingWidget: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => AddOrUpdateVenueScreen()),
        label: const Text(
          "Add Venue",
        ),
        backgroundColor: primaryColor,
      ),
      body: GetBuilder<VenueOwnerController>(initState: (state) {
        VenueOwnerController.controller.getAllVenuesByUser();
      }, builder: (_) {
        if (_.userAllVenuesList.isEmpty) {
          return const Center(
            child: Text("You have not added any venues yet"),
          );
        }
        return RefreshIndicator(
          onRefresh: () => VenueOwnerController.controller.getAllVenuesByUser(),
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              mainAxisExtent: 240,
            ),
            itemBuilder: ((context, index) {
              var model = _.userAllVenuesList[index].venues;
              return ListView.builder(
                  itemCount: model?.length,
                  itemBuilder: (context, index1) {
                    var model1 = _.userAllVenuesList[index].venues?[index1];
                    return InkWell(
                      onTap: () => Get.to(() => VenueOwnerVenueScreen(
                            venueId: model1?.id.toString(),
                          )),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: model1?.image ?? '',
                                fit: BoxFit.cover,
                                height: 150,
                                width: appWidth,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model1?.name?.trim() ?? '',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 14,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        "Pokhara",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rs ${model1?.price ?? ''}",
                                    style: GoogleFonts.poppins(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
            itemCount: _.userAllVenuesList.length,
          ),
        );
      }),
    );
  }
}

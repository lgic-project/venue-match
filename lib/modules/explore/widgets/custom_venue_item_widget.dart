import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/model/venue_model.dart';

import '../../single_venue/single_venue_screen.dart';

class CustomVenueItemWidget extends StatelessWidget {
  Venues venues;

  CustomVenueItemWidget({super.key, required this.venues});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.to(() => SingleVenueScreen(
      //       id: "${venues.id}",
      //     )),
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
                imageUrl: venues.image ?? '',
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
                    venues.name?.trim() ?? '',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: const [
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
                    "Rs ${venues.price ?? ''}",
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
  }
}

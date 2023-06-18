import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/venue/venue_controller.dart';
import 'package:my_first_app/widgets/custom_button.dart';
import 'package:my_first_app/widgets/custom_cached_network_image_widget.dart';

class SingleVenueScreen extends StatelessWidget {
  SingleVenueScreen({
    super.key,
    this.id,
  });
  final String? id;
  var controller = VenueController.controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VenueController>(initState: (state) {
      controller.getVenues(id: id);
    }, builder: (_) {
      var model = _.singleVenueList.first;
      return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                              color: Colors.grey.withOpacity(.75),
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: CustomCachedNetworkImageWidget(
                          image: model.image,
                          width: appWidth,
                          height: appHeight / 2.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            model.name ?? '',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomButton(
              screenWidth: appWidth,
              label: 'Book Now',
            ),
          ],
        )),
      );
    });
  }
}

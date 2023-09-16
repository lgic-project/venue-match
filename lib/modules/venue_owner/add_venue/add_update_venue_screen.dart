import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/data/controller/venue_owner/venue_owner_controller.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';
import 'package:my_first_app/widgets/custom_text_form_field.dart';

import '../../../constant.dart';
import '../../../data/controller/category/category_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_cached_network_image_widget.dart';

class AddOrUpdateVenueScreen extends StatelessWidget {
  final bool? isForUpdate;
  var controller = VenueOwnerController.controller;
  final String? venueId;
  AddOrUpdateVenueScreen({
    super.key,
    this.isForUpdate = false,
    this.venueId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: '${isForUpdate == true ? 'Update' : 'Add'} Venue',
      ),
      body: GetBuilder<VenueOwnerController>(initState: (state) {
        controller.clearFields();
        if (isForUpdate == true) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            controller.getSingleVenueByUser(id: venueId);
            controller.initVenueDetails();
          });
        }
      }, builder: (_) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _.venueFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                if (_.venueImage != null && _.venueImage != "") ...[
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => _.getImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomCachedNetworkImageWidget(
                          image: _.venueImage,
                          height: 200,
                          width: appWidth,
                          placeHolderHeight: 80,
                          placeHolderWidth: 80,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Visibility(
                    visible: _.venueImageFile != null ? true : false,
                    child: GestureDetector(
                      onTap: () => _.getImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          height: 200,
                          fit: BoxFit.cover,
                          File(_.venueImageFile?.path ?? ""),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _.venueImageFile == null ? true : false,
                    child: GestureDetector(
                      onTap: () {
                        _.getImage();
                      },
                      child: DottedBorder(
                        color: Colors.grey,
                        dashPattern: const [5, 5],
                        child: SizedBox(
                          height: 200,
                          width: appWidth,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black38,
                              ),
                              Text(
                                "Upload Your Venue Image",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  icon: Icons.location_city_outlined,
                  controller: _.nameController,
                  hint: "Enter Venue Name",
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  icon: Icons.price_change_outlined,
                  controller: _.priceController,
                  hint: "Enter Venue Price",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  icon: Icons.pin_drop_outlined,
                  controller: _.locationController,
                  hint: "Enter Venue Location",
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  icon: Icons.reduce_capacity_outlined,
                  controller: _.capacityController,
                  hint: "Enter Venue Capacity",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _.descriptionController,
                  maxLines: 4,
                  hint: "Enter Venue Descirption",
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                Text(
                  "Cateogory",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<CategoryController>(initState: (state) {
                  CategoryController.controller.getCategories();
                }, builder: (__) {
                  return DropdownButtonFormField(
                    hint: const Text('Select Category'),
                    items: __.categoriesList
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item.id.toString(),
                            child: Text(
                              item.name ?? '',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        )
                        .toList(),
                    value: isForUpdate == true
                        ? _.categoryId
                        : __.categoriesList.first.id.toString(),
                    onChanged: (value) => _.setCategoryDropdownValue(value),
                    decoration: InputDecoration(
                      fillColor: lightColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if (isForUpdate == true && _.venueImageFile == null) {
                      Get.rawSnackbar(
                          message: "You cannot update the same image");
                    } else {
                      _.addUpdateVenue(isForUpdate: isForUpdate);
                    }
                  },
                  child: CustomButton(
                    label: isForUpdate == true ? 'Update' : 'Add',
                    screenWidth: appWidth,
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

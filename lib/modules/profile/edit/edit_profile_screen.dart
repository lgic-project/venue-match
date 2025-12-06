import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_first_app/widgets/custom_app_bar_widget.dart';
import 'package:my_first_app/widgets/custom_text_field.dart';

import '../../../constant.dart';
import '../../../data/controller/profile/profile_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_cached_network_image_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Edit Profile",
      ),
      body: GetBuilder<ProfileController>(
        initState: (state) {
          ProfileController.controller.clearFields();
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ProfileController.controller.getUserData();
          });
        },
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if (_.profileImage != null && _.profileImage != "") ...[
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => _.getImage(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: CustomCachedNetworkImageWidget(
                            image: _.profileImage,
                            height: 90,
                            width: 90,
                            placeHolderHeight: 40,
                            placeHolderWidth: 40,
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Visibility(
                      visible: _.profilePic != null ? true : false,
                      child: GestureDetector(
                        onTap: () => _.getImage(),
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                              File(_.profilePic?.path ?? ""),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _.profilePic == null ? true : false,
                      child: GestureDetector(
                        onTap: () {
                          _.getImage();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                          spreadRadius: 1,
                                          color: Colors.grey.shade300,
                                        )
                                      ]),
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: secondaryColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    icon: Icons.person_outline,
                    controller: _.firstNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    icon: Icons.person_outline,
                    controller: _.lastNameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => _.udpateProfile(),
                    child: CustomButton(
                      label: "Update Profile",
                      screenWidth: appWidth,
                      backgroundColor: primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/profile/profile_controller.dart';
import 'package:my_first_app/modules/profile/edit/edit_profile_screen.dart';
import 'package:my_first_app/modules/profile/password/change_password_screen.dart';
import 'package:my_first_app/widgets/custom_button.dart';

import '../../data/controller/app_controller.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/custom_cached_network_image_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Profile",
        hasLeadingWidget: false,
      ),
      body: GetBuilder<ProfileController>(initState: (state) {
        ProfileController.controller.getUserData();
      }, builder: (_) {
        var model = _.userData;
        return RefreshIndicator(
          onRefresh: () => ProfileController.controller.getUserData(),
          child: ListView(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                            model.profilePic == null || model.profilePic == ""
                                ? Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Center(
                                      child: Text(
                                        model.firstname?[0].capitalize ?? 'N/A',
                                        style: const TextStyle(
                                          color: lightColor,
                                          fontSize: 26,
                                        ),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: CustomCachedNetworkImageWidget(
                                      image: model.profilePic,
                                      height: 90,
                                      width: 90,
                                      placeHolderHeight: 40,
                                      placeHolderWidth: 40,
                                    ),
                                  ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${model.firstname} ${model.lastname}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      UserDetailsWidget(
                          leadingText: 'First Name',
                          trailingText: model.firstname),
                      const Divider(height: 40),
                      UserDetailsWidget(
                          leadingText: 'Last Name',
                          trailingText: model.lastname),
                      const Divider(height: 40),
                      UserDetailsWidget(
                          leadingText: 'Email', trailingText: model.email),
                      const Divider(height: 40),
                      UserDetailsWidget(
                          leadingText: 'Account Type',
                          trailingText: model.role.toString().capitalizeFirst),
                      const Divider(height: 40),
                      UserControlWidget(
                        label: "Edit Profile",
                        icon: Icons.person,
                        onTap: () => Get.to(() => const EditProfileScreen()),
                      ),
                      const Divider(height: 40),
                      UserControlWidget(
                        label: "Change Password",
                        icon: Icons.lock,
                        onTap: () => Get.to(() => const ChangePasswordScreen()),
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content:
                                  const Text('Are you sure want to Logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    AppController.controller.logout();
                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CustomButton(
                          screenWidth: appWidth,
                          label: "Logout",
                          backgroundColor: primaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }
}

class UserControlWidget extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Function()? onTap;
  const UserControlWidget({
    super.key,
    this.label,
    this.icon,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondaryColor,
                ),
                padding: const EdgeInsets.all(6),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label ?? "",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class UserDetailsWidget extends StatelessWidget {
  final String? leadingText, trailingText;

  const UserDetailsWidget({
    super.key,
    this.leadingText,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText ?? '',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        Text(
          "$trailingText",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

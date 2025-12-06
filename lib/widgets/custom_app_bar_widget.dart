import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_first_app/constant.dart';

import '../data/controller/app_controller.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool? hasLeadingWidget, hasTrailingWidget;
  const CustomAppBarWidget({
    super.key,
    this.title,
    this.hasLeadingWidget = true,
    this.hasTrailingWidget = false,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: hasLeadingWidget == true
          ? GestureDetector(
              onTap: () => Get.back(),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                  size: 18,
                ),
              ),
            )
          : null,
      actions: hasTrailingWidget == true
          ? [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text('Are you sure want to Logout?'),
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
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.logout_outlined,
                    size: 24,
                    color: primaryColor,
                  ),
                ),
              ),
            ]
          : null,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

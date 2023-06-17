import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.title,
  });
  final String? title;
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
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
          size: 16,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

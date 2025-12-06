import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_first_app/data/model/category.dart';
import 'package:my_first_app/modules/single_category/category_screen.dart';

class CategoryTile extends StatelessWidget {
  Categories category;

  CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CategoryScreen(
            id: "${category.id}",
            name: category.name,
          )),
      child: Column(children: [
        CachedNetworkImage(
          imageUrl: category.image??'',
          width: 30,
          height: 30,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          category.name ?? '',
          style: const TextStyle(fontSize: 12),
        ),
      ]),
    );
  }
}

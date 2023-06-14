import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/category.dart';

class CategoryTile extends StatelessWidget {
  Categories category;

  CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CachedNetworkImage(
        imageUrl: category.image ?? '',
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
    ]);
  }
}

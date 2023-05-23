import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/category.dart';

class CategoryTile extends StatelessWidget {
  Category category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        category.icon,
        width: 50,
        height: 50,
      ),
      Text(category.label),
    ]);
  }
}

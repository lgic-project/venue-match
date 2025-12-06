import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_first_app/data/controller/category/category_controller.dart';
import 'package:my_first_app/modules/single_venue/single_venue_screen.dart';

import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/custom_loading_widget.dart';
import 'widgets/custom_venue_item_by_category_widget.dart';

class CategoryScreen extends StatelessWidget {
  final String? id, name;
  var controller = CategoryController.controller;

  CategoryScreen({
    super.key,
    this.id,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: name),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<CategoryController>(initState: (state) {
          controller.getVenuesByCategory(categoryId: id);
        }, builder: (_) {
          return RefreshIndicator(
            onRefresh: () => controller.getVenuesByCategory(categoryId: id),
            child: _.isLoading
                ? const CustomLoadingWidget(
                    height: 300,
                    width: 300,
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () => Get.to(() => SingleVenueScreen(
                                  id: _.venuesRelatedToCategoryList[index].id
                                      .toString(),
                                  isFromCategory: true,
                                  categoryId: id,
                                )),
                            child: CustomVenueItemByCategoryWidget(
                              venues: _.venuesRelatedToCategoryList[index],
                            ),
                          ),
                        )),
                    itemCount: _.venuesRelatedToCategoryList.length,
                  ),
          );
        }),
      ),
    );
  }
}

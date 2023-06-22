import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/data/controller/category/category_controller.dart';
import 'package:my_first_app/data/controller/venue/venue_controller.dart';
import 'package:my_first_app/modules/explore/widgets/category_tile.dart';
import 'package:my_first_app/modules/explore/widgets/custom_venue_item_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Discover your perfect venue match.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomSearchBarWidget(),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Categories",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<CategoryController>(initState: (state) {
              CategoryController.controller.getCategories();
            }, builder: (_) {
              return SizedBox(
                //top layer matra scrollgarna xa tehi vara
                height: 60,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemBuilder: ((context, index) => CategoryTile(
                        category: _.categoriesList[index],
                      )),
                  scrollDirection: Axis.horizontal,
                  itemCount: _.categoriesList.length,
                ),
              );
            }),
            const SizedBox(height: 10),
            Text(
              "Recommendation",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GetBuilder<VenueController>(initState: (state) {
                VenueController.controller.getVenues();
              }, builder: (__) {
                return RefreshIndicator(
                  onRefresh: () => VenueController.controller.getVenues(),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder: ((context, index) => CustomVenueItemWidget(
                          venues: __.venuesList[index],
                        )),
                    itemCount: __.venuesList.length,
                  ),
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: .3,
          color: Colors.grey,
        ),
      ),
      child: Row(children: const [
        Icon(
          Icons.search_outlined,
          size: 18,
          color: Colors.grey,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'Search',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }
}

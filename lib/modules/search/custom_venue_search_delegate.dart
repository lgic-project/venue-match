import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_first_app/data/controller/venue/venue_controller.dart';
import 'package:my_first_app/data/model/venue_model.dart';

import '../single_category/widgets/custom_venue_item_by_category_widget.dart';
import '../single_venue/single_venue_screen.dart';

class CustomVenueSearchDelegate extends SearchDelegate {
  var venueList = VenueController.controller.venuesList;

  @override
  String? get searchFieldLabel => "Search Venues";

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 15,
      );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var matchedVenues = [];
    for (Venues venue in venueList) {
      if ((venue.name?.toLowerCase() ?? '').contains(query.toLowerCase())) {
        matchedVenues.add(venue);
      }
    }
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: matchedVenues.isEmpty
          ? const Center(
              child: Text(
                'No Results found',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () => Get.to(() => SingleVenueScreen(
                            id: matchedVenues[index].id.toString(),
                          )),
                      child: CustomVenueItemByCategoryWidget(
                        venues: matchedVenues[index],
                      ),
                    ),
                  )),
              itemCount: matchedVenues.length,
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var matchedVenues = [];
    for (Venues venue in venueList) {
      if ((venue.name?.toLowerCase() ?? '').contains(query.toLowerCase())) {
        matchedVenues.add(venue);
      }
    }
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: matchedVenues.isEmpty
          ? const Center(
              child: Text(
                'No Results found',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () => Get.to(() => SingleVenueScreen(
                            id: matchedVenues[index].id.toString(),
                          )),
                      child: CustomVenueItemByCategoryWidget(
                        venues: matchedVenues[index],
                      ),
                    ),
                  )),
              itemCount: matchedVenues.length,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/category.dart';
import 'package:my_first_app/modules/search_view/widgets/category_tile.dart';
import 'package:my_first_app/modules/search_view/widgets/destination_tile.dart';

import '../../../data/model/destination.dart';

class EngagementScreen extends StatelessWidget {
  EngagementScreen({super.key});

  double screenHeight = 0;
  double screenWidth = 0;

  List<Destination> destinationList = [
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Mountain",
        rupess: "Rs500"),
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Pokhara",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Pokhara",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Pokhara",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Pokhara",
        rupess: "Rs50000"),
  ]; //category rakheko string narakhi kina khi hamlaii category ko duitai value acces garna xa icon ra label testaile

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenHeight / 60, vertical: screenWidth / 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Let's make your birthday special!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //space rakherko
              children: [
                const Text(
                  "Recommendation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.start,
                ),
                const Text("See All", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 320,
              child: ListView.builder(
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: DestinationTile(
                        destination: destinationList[index],
                      ),
                    )),
                scrollDirection: Axis.horizontal,
                itemCount: destinationList.length,
              ),
            ),
            SizedBox(height: 5),
          ]),
        )),
      ),
    );
  }
}

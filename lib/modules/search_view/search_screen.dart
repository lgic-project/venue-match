import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/category.dart';
import 'package:my_first_app/modules/search_view/categories/birthday_screen.dart';
import 'package:my_first_app/modules/search_view/categories/concerts_screen.dart';
import 'package:my_first_app/modules/search_view/widgets/category_tile.dart';
import 'package:my_first_app/modules/search_view/widgets/destination_tile.dart';
import 'package:my_first_app/modules/single_destination/details_screen.dart';
import '../../constant.dart';
import '../../data/model/destination.dart';
import '../../widgets/custom_button.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  double screenHeight = 0;
  double screenWidth = 0;
  List<Category> categoryList = [
    Category(icon: "assets/images/wedding.png", label: "Wedding"),
    Category(icon: "assets/images/birthday.png", label: "Birthday"),
    Category(icon: "assets/images/festive.png", label: "Festive"),
    Category(icon: "assets/images/formal.png", label: "Formal"),
    Category(icon: "assets/images/happy.png", label: "Concerts"),
    Category(icon: "assets/images/engagement.jpg", label: "Engagement"),
  ];
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
              "Uniting Dreamers And Venues!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            // CustomTextField(
            //   icon: Icons.search_outlined,
            //   label: "Search now",
            //   border:
            //       OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              //top layer matra scrollgarna xa tehi vara
              height: 80,
              child: ListView.builder(
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: CategoryTile(
                        category: categoryList[index],
                      ),
                    )),
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
              ),
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
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BirthdayScreen()));
                },
                child: CustomButton(
                  screenWidth: screenWidth,
                  label: "Go to detail screen ",
                  textColor: primary,
                )),
          ]),
        )),
      ),
    );
  }
}

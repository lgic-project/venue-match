import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_first_app/controller/category_controller.dart';
import 'package:my_first_app/modules/search_view/widgets/category_tile.dart';
import 'package:my_first_app/modules/search_view/widgets/destination_tile.dart';
import '../../data/model/destination.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  double screenHeight = 0;
  double screenWidth = 0;

  List<Destination> destinationList = [
    Destination(
        image: "assets/images/pokharagrandee.webp",
        label: "Pokhara Grandee",
        rupess: "Rs500"),
    Destination(
        image: "assets/images/barahihotel.png",
        label: "Barahi",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/crystalmahal2.png",
        label: "Crystal Mahal",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/whitehousepartypalace.png",
        label: "White House",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/citysquare2.png",
        label: "City Square",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/golden.png",
        label: "Golden House",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/browneyes2.png",
        label: "Brown Eyes",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/rabimahal3.png",
        label: "Rabi Mahak",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/durbarthok.png",
        label: "Durbar Thok",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/Waterfornt.png",
        label: "Water Front",
        rupess: "Rs50000"),
    Destination(
        image: "assets/images/ranjit.png", label: "Ranjit", rupess: "Rs50000"),
  ]; //category rakheko string narakhi kina khi hamlaii category ko duitai value acces garna xa icon ra label testaile

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(initState: (state) {
      CategoryController.controller.getCategories();
    }, builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Discover your perfect venue match.",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomSearchBarWidget(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                //top layer matra scrollgarna xa tehi vara
                height: 60,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemBuilder: ((context, index) => CategoryTile(
                        category: _.categoriesList[index],
                      )),
                  scrollDirection: Axis.horizontal,
                  itemCount: _.categoriesList.length,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Recommendation",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: ((context, index) => DestinationTile(
                        destination: destinationList[index],
                      )),
                  itemCount: destinationList.length,
                ),
              ),
            ]),
          ),
        ),
      );
    });
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
          style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
        ),
      ]),
    );
  }
}

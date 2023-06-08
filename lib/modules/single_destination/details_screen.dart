import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/constant.dart';

class Detailscreen extends StatefulWidget {
  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 158, 227, 196),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 242, 236, 236),
                  border:
                      Border.all(color: Color.fromARGB(255, 195, 186, 186))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/pokharagrandee.webp",
                      width: 450,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Pokhara Grandee",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      SizedBox(
                        width: 150,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 94, 84, 84),
                      ),
                      SizedBox(width: 5),
                      const Text(
                        "Birauta",
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 10, 10),
                            fontSize: 18),
                      ),
                      SizedBox(width: 220),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: "Overview",
                          ),
                          Tab(
                            text: "Details",
                          ),
                          Tab(
                            text: "Review",
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 300,
                    child: TabBarView(controller: _tabController, children: [
                      Text(
                        "Pokhara Grande is a prestigious five-star hotel in Pokhara, Nepal, offering a perfect blend of luxury, impeccable service, and tranquility. Renowned internationally for its excellence, it has been listed among the top ten hotels in Nepal. With the recent addition of C Block, the hotel seamlessly combines elegance and style. Situated in the heart of Pokhara, it provides easy access to attractions, restaurants, and the beautiful Phewa Lake while offering a peaceful retreat from the city's hustle and bustle. Pokhara Grande also offers spacious venues for weddings, engagements, birthdays, and festive functions, ensuring unforgettable experiences. Discover nature, comfort, and exceptional hospitality at Pokhara Grande.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(159, 17, 16, 16)),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Full Name "),
                              SizedBox(
                                width: 150,
                              ),
                              Text(
                                " Pokhara Grandee ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(159, 17, 16, 16)),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Location "),
                              SizedBox(
                                width: 155,
                              ),
                              Text(" Birauta,Pokhara-17 "),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Location "),
                              SizedBox(
                                width: 155,
                              ),
                              Text(" Birauta,Pokhara-17 "),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Location "),
                              SizedBox(
                                width: 155,
                              ),
                              Text(" Birauta,Pokhara-17 "),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Location "),
                              SizedBox(
                                width: 155,
                              ),
                              Text(" Birauta,Pokhara-17 "),
                            ],
                          ),
                        ],
                      ),
                      Text(" "),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

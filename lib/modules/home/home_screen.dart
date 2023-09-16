import 'package:flutter/material.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/controller/app_controller.dart';
import 'package:my_first_app/modules/explore/explore_screen.dart';
import 'package:my_first_app/modules/history/history_screen.dart';
import 'package:my_first_app/modules/venue_owner/venue_owner_home_screen.dart';

import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const ExploreScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;

  var controller = AppController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.getUserType() == 'user'
          ? IndexedStack(
              index: _selectedIndex,
              children: screens,
            )
          : const VenueOwnerHomeScreen(),
      bottomNavigationBar: controller.getUserType() == 'user'
          ? BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.black54,
              selectedItemColor: primaryColor,
              showUnselectedLabels: true,
              items: [
                _customBottomNavigationBarItem(
                    Icons.explore_outlined, "Explore"),
                _customBottomNavigationBarItem(Icons.history, "Booking"),
                _customBottomNavigationBarItem(
                    Icons.person_outline_outlined, "Profile"),
              ],
            )
          : null,
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}

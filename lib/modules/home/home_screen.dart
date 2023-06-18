import 'package:flutter/material.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/modules/booking/booking_screen.dart';
import 'package:my_first_app/modules/search_view/explore_screen.dart';

import '../profile/profile_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> screens = [
    ExploreScreen(),
    BookingScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black54,
          selectedItemColor: primary,
          showUnselectedLabels: true,
          items: [
            _customBottomNavigationBarItem(Icons.explore_outlined, "Explore"),
            _customBottomNavigationBarItem(Icons.payment, "Booking"),
            _customBottomNavigationBarItem(
                Icons.person_outline_outlined, "Profile"),
          ]),
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}

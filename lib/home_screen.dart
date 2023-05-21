import 'package:flutter/material.dart';
import 'package:venue_match/constant.dart';
//import 'package:my_first_app/modules/booking_screen.dart';
//import 'package:my_first_app/modules/profile_screen.dart';
//import 'package:my_first_app/modules/search_view/search_screen.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> screens = [
   //SearchScreen(),
    //const ProfileScreen(),
   // BookingScreen(),
    //const ProfileScreen(),
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
            _customBottomNavigationBarItem(Icons.search_off_outlined, "search"),
            _customBottomNavigationBarItem(
                Icons.favorite_outline_outlined, "favorite"),
            _customBottomNavigationBarItem(Icons.flight_takeoff, "Booking"),
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

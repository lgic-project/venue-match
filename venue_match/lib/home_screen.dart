import 'package:flutter/material.dart';
import 'package:venue_match/constant.dart';
import 'package:venue_match/modules/booking_screen.dart';
import 'package:venue_match/modules/profile_screen.dart';
import 'package:venue_match/modules/search_view/search_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> screens = [
    SearchScreen(),
    const ProfileScreen(),
    const BookingScreen(),
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
                Icons.person_outline_outlined, "Profile"),
            _customBottomNavigationBarItem(Icons.flight_takeoff, "Booking"),
            _customBottomNavigationBarItem(
                Icons.notification_add_rounded, "notification"),
          ]),
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}

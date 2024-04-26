import 'package:flutter/material.dart';
import 'package:sathishui/addbday.dart';
import 'package:sathishui/bdaylist.dart';

import 'package:sathishui/homescreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  List<Map<String, String>> allBirthdays = [];
  List<Map<String, String>> upcomingBirthdays = [];
  final List<Widget> _screens = [
    UpcomingBirthdaysScreen(),
    AddBirthday(),
    AllBirthdaysScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 28.0,
        backgroundColor: const Color.fromARGB(255, 36, 62, 208),
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 0, 89, 255),
        unselectedItemColor: Color.fromARGB(255, 13, 16, 22),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cake_rounded,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 220, 235),
      
    body: Center(
        child: Text('Profile Screen'),                               
      ),
    );
  }
}

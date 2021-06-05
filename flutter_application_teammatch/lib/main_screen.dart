import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/screen/profile.dart';
import 'package:flutter_application_teammatch/screen/tourment.dart';
import 'package:flutter_application_teammatch/screen/home.dart';
import 'package:flutter_application_teammatch/screen/team.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;

  final screen = [
    HomeScreen(),
    TourmentScreen(),
    TeamScreen(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          iconSize: 10,
          currentIndex: _selectIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.gamepad, size: 30),
                label: 'Tournament',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.group, size: 30),
                label: 'Team',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: 'Profile',
                backgroundColor: Colors.grey)
          ],
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          }),
    );
  }
}

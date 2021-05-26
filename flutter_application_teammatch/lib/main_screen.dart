import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_teammatch/screen/account.dart';
import 'package:flutter_application_teammatch/screen/tourment.dart';
import 'package:flutter_application_teammatch/screen/home.dart';
import 'package:flutter_application_teammatch/screen/team.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  final screen = [
    HomeScreen(),
    TourmentScreen(),
    TeamScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.gamepad_rounded,
            size: 30,
          ),
          Icon(Icons.group, size: 30),
          Icon(
            Icons.person,
            size: 30,
          )
        ],
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/pages/edit_profile_page.dart';
import 'package:flutter_application_teammatch/profile/datas_widget.dart';
import 'package:flutter_application_teammatch/profile/button_widget.dart';
import 'package:flutter_application_teammatch/profile/profile_widget.dart';
import 'package:flutter_application_teammatch/profile/user.dart';
import 'package:flutter_application_teammatch/profile/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header_home.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text('Profile'), backgroundColor: Colors.transparent),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 30),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async{
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {
                    
                  });
                },
              ),
              const SizedBox(height: 25),
              buildName(user),
              const SizedBox(height: 25),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 25),
              DatasWidget(),
              const SizedBox(height: 25),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(user.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white)),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.white),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Subscribe',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 15),
          Text(
            user.about,
            style: TextStyle(fontSize: 15, height: 1.5, color: Colors.white),
          )
        ],
      ));
}

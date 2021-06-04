import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/profile/button_widget.dart';
import 'package:flutter_application_teammatch/profile/profile_widget.dart';
import 'package:flutter_application_teammatch/profile/textfield_widget.dart';
import 'package:flutter_application_teammatch/profile/user.dart';
import 'package:flutter_application_teammatch/profile/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Edit profile'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/luna.jpg'), fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 30),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 25),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) =>user = user.copy(name:name),
            ),
            const SizedBox(height: 25),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) =>user = user.copy(email:email),
            ),
            const SizedBox(height: 25),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) =>user = user.copy(about:about),
            ),
            const SizedBox(height:25),
            ButtonWidget(
              text:'Save Changes',
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ));
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/User/bloc/bloc_user.dart';
import 'package:flutter_application_teammatch/global_widgets/button_green.dart';
import 'package:flutter_application_teammatch/global_widgets/gradient_back.dart';
import 'package:flutter_application_teammatch/login/login_page.dart';
import 'package:flutter_application_teammatch/main_screen.dart';
import 'package:flutter_application_teammatch/profile/button_widget.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return MainScreen();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome \n This App is For You",
                style: TextStyle(
                    fontSize: 37.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signIn();
                },
                width: 300.0,
                height: 50.0,
              ),
              ButtonWidget(
                text: 'Other login',
                onClicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

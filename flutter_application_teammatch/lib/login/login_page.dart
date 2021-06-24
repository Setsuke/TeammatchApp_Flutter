import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/login/utils/responsive.dart';
import 'package:flutter_application_teammatch/login/widgets/login_form.dart';
import 'package:flutter_application_teammatch/login/widgets/logo_container.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: responsive.width,
            height: responsive.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bike.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    child: Column(
                      children: [
                        LogoContainer(
                          size: size.width * 0.17,
                        ),
                        SizedBox(height: responsive.dp(2.5)),
                        Text(
                          "Welcome to Wheel Manager",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.dp(1.8)),
                        ),
                      ],
                    ),
                    top: 50),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

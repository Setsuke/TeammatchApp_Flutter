import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/login/login_page.dart';
import 'package:flutter_application_teammatch/login/utils/responsive.dart';
import 'package:flutter_application_teammatch/login/widgets/register_form.dart';

class ResgiterPage extends StatefulWidget {
  @override
  _ResgiterPageState createState() => _ResgiterPageState();
}

class _ResgiterPageState extends State<ResgiterPage> {
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
                    image: AssetImage('assets/login.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    child: Column(
                      children: [
                        Text(
                          "Hello!\nSign up to get started",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.dp(1.6)),
                        ),
                        SizedBox(
                          height: responsive.dp(2.5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black26,
                                  offset: Offset(0, 20),
                                ),
                              ]),
                          child: ClipOval(
                            child: Image.network(
                              'http://cemokalab.com/wp-content/uploads/2015/07/avatar-372-456324.png',
                              width: responsive.wp(25),
                              height: responsive.hp(25),
                            ),
                          ),
                        )
                      ],
                    ),
                    top: 50),
                RegisterForm(),
                Positioned(
                    left: 15,
                    top: 15,
                    child: SafeArea(
                      child: CupertinoButton(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

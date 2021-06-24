import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 0.0;
  GradientBack(this.title, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bike.jpeg'), fit: BoxFit.cover)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}

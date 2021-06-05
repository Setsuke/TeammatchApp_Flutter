import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.text,
    this.onClicked,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    child:Text(text),
    onPressed: onClicked,
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)
    )
    );
}
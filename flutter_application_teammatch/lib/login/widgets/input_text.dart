import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText, borderEnabled;
  final double fontSize;
  final void Function(String text) onChanged;
  final String Function(String text) validator;
  const InputText(
      {Key key,
      this.label = '',
      this.keyboardType = TextInputType.text,
      this.borderEnabled = true,
      this.fontSize = 15,
      this.onChanged,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: TextFormField(
        validator: this.validator,
        style: TextStyle(fontSize: this.fontSize),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: this.keyboardType,
        obscureText: this.obscureText,
        onChanged: this.onChanged,
        decoration: InputDecoration(
            labelText: this.label,
            border: this.borderEnabled ? null : InputBorder.none,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/login/utils/responsive.dart';
import 'package:flutter_application_teammatch/login/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '', _username = '';

  _submit() {
    final isOk = _formKey.currentState.validate();
    print("form isOk $isOk");
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 430 : 360),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            InputText(
              keyboardType: TextInputType.emailAddress,
              label: "USERNAME",
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
              onChanged: (text) {
                _username = text;
              },
              validator: (text) {
                if (text.trim().length > 5) {
                  return "invalid username";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText(
              keyboardType: TextInputType.emailAddress,
              label: "EMAIL ADDRESS",
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
              onChanged: (text) {
                _email = text;
              },
              validator: (text) {
                if (!text.contains("@")) {
                  return "invalid email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            InputText(
              keyboardType: TextInputType.emailAddress,
              label: "PASSWORD",
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
              onChanged: (text) {
                _password = text;
              },
              validator: (text) {
                if (text.trim().length > 6) {
                  return "invalid password";
                }
                return null;
              },
            ),
            SizedBox(height: responsive.hp(2)),
            SizedBox(
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: this._submit,
                child: Text('Sign up',
                    style: TextStyle(
                        color: Colors.white, fontSize: responsive.dp(1.6))),
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.orangeAccent[200],
              ),
            ),
            SizedBox(height: responsive.hp(2)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Already have a account?",
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(1.6))),
              // ignore: deprecated_member_use
              FlatButton(
                  //Cmaibar cunado se desarrolle el consumo de api rest
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.orangeAccent[200]),
                  ))
            ]),
            SizedBox(
              height: responsive.dp(10),
            )
          ]),
        ),
      ),
    );
  }
}

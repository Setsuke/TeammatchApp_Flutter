import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/login/register_page.dart';
import 'package:flutter_application_teammatch/login/utils/responsive.dart';
import 'package:flutter_application_teammatch/login/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';

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
              label: "Email Address",
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
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputText(
                      label: "Password",
                      onChanged: (text) {
                        _password = text;
                      },
                      validator: (text) {
                        if (text.trim().length == 0) {
                          return "Invalid Password";
                        }
                        return null;
                      },
                      obscureText: true,
                      borderEnabled: false,
                      fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsive.hp(2)),
            SizedBox(
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: this._submit,
                child: Text('Sign in',
                    style: TextStyle(
                        color: Colors.white, fontSize: responsive.dp(1.6))),
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.orangeAccent[200],
              ),
            ),
            SizedBox(height: responsive.hp(2)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("New to Wheel Manager?",
                  style: TextStyle(
                      color: Colors.white, fontSize: responsive.dp(1.6))),
              // ignore: deprecated_member_use
              FlatButton(
                  //Cmaibar cunado se desarrolle el consumo de api rest
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResgiterPage()));
                  },
                  child: Text(
                    "Sign up",
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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/User/bloc/bloc_user.dart';
import 'package:flutter_application_teammatch/User/bloc/sign_in_screen.dart';
import 'package:flutter_application_teammatch/profile/user_preferences.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wheel Manager',
          home: SignInScreen(),
        ),
        bloc: UserBloc());

    //title: 'Wheel Manager',
    //theme: ThemeData(
    // primaryColor: Colors.orange,
    // ignore: deprecated_member_use
    // accentColor: Colors.orangeAccent[200],
    // ),
    //  home: Login(),
    //  );
  }
}

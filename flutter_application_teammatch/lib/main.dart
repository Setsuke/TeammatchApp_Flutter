import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/main_screen.dart';
import 'package:flutter_application_teammatch/profile/user_preferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeamMatch',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

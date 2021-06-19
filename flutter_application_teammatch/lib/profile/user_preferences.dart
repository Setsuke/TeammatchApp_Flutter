import 'dart:convert';

import 'package:flutter_application_teammatch/profile/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences _preferences;
  static const _keyUser = "user";

  static const myUser = User(
    imagePath:'https://i.imgur.com/2VcNXz2.jpg',
    name: 'Dylan Wang',
    email: 'dylan.wang@gmail.com',
    about: 'Me considero un jugador de League of Legends bastante competitivo. He estado en equipos profesionales pero por ahora solo busco entretenerme y hacer amigos',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async{
    final json=jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser(){
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
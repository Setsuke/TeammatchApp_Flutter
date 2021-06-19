import 'dart:convert';
import 'package:flutter_application_teammatch/models/tournament.dart';
import 'package:http/http.dart' as http;

class TournamentsApi {
  static Future<List<Tournament>> getTournaments() async {
    final url =
        'https://api.pandascore.co/lol/leagues?page[size]=5&token=jGhCbVNlvEPNoT5DUWhUD2faknOSdqJOJZ2_3oGtwkzFX09J684';
    final response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<Tournament>(Tournament.fromJson).toList();
  }
}

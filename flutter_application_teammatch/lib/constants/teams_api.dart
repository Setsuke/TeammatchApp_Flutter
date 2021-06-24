import 'dart:convert';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:http/http.dart' as http;

class TeamsApi {
  static Future<List<Team>> getTeams() async {
    final url = Uri.parse(
        'https://api.pandascore.co/tournaments/2400/teams?token=jGhCbVNlvEPNoT5DUWhUD2faknOSdqJOJZ2_3oGtwkzFX09J684');
    final response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<Team>(Team.fromJson).toList();
  }
}

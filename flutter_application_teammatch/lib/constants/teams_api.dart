import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:http/http.dart' as http;

class TeamsApi {
  static Future<List<Team>> getTeams() async {
    final url =
        'https://api.pandascore.co/tournaments/2400/teams?token=jGhCbVNlvEPNoT5DUWhUD2faknOSdqJOJZ2_3oGtwkzFX09J684';
    final response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<Team>(Team.fromJson).toList();
  }

  static Future<List<Team>> getTeamsLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/teams.json');
    final body = json.decode(data);

    return body.map<Team>(Team.fromJson).toList();
  }
}

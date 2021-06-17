import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_teammatch/constants/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_teammatch/models/team.dart';

class HttpHelper {
  Future<List?> getTeams(String urlOption) async {
    final strPopular = urlBase + urlOption;
    final url = Uri.parse(strPopular);

    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final teamsMap = jsonResponse['results'];
      List teams = teamsMap.map((map) => Team.fromJson(map)).toList();
      return teams;
    } 
    
  }
}

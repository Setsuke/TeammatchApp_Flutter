import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/pages/team_network_page.dart';
import 'package:flutter_application_teammatch/pages/tournament_network_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header_home.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Home'),
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              _cardTournament(context),
              SizedBox(
                height: 100.0,
              ),
              _cardTeams(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardTournament(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage('assets/torneo.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              child: InkWell(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TournamentNetworkPage()));
                FirebaseAnalytics analytics = FirebaseAnalytics();
                print('HomeTournament');
                analytics.logEvent(
                    name: "SearchTournament", parameters: <String, dynamic>{});
              }),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Search Tournament',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            )
          ],
        ),
      );

  Widget _cardTeams(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage('assets/teams.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              child: InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeamNetworkPage()));
                FirebaseAnalytics analytics = FirebaseAnalytics();
                print('HomeTeam');
                analytics.logEvent(
                    name: "SearchTeam", parameters: <String, dynamic>{});
              }),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Search Team',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            )
          ],
        ),
      );
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/pages/tournament_create.dart';
import 'package:flutter_application_teammatch/pages/tournament_joined.dart';

class TourmentScreen extends StatefulWidget {
  @override
  _TourmentScreenState createState() => _TourmentScreenState();
}

class _TourmentScreenState extends State<TourmentScreen> {
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
            title: Text('Tournaments'),
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
              image: AssetImage('assets/createTournament.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              child: InkWell(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TournamentCreate()));
                FirebaseAnalytics analytics = FirebaseAnalytics();
                print('TournametCreate');
                analytics.logEvent(
                    name: "CreateTournament",
                    parameters: <String, dynamic>{
                      'plant_name': 'String',
                    });
              }),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'My Created Tournaments',
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
              image: AssetImage('assets/joinTournament.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              child: InkWell(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TournamentSubscribe()));
                FirebaseAnalytics analytics = FirebaseAnalytics();
                print('TournametJoin');
                analytics.logEvent(
                    name: "JoinTournament",
                    parameters: <String, dynamic>{
                      'plant_name': 'String',
                    });
              }),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'My Joined Tournaments',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            )
          ],
        ),
      );
}

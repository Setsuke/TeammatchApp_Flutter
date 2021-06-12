import 'package:flutter/material.dart';

class TournamentSubscribe extends StatefulWidget {
  @override
  _TournamentSubscribeState createState() => _TournamentSubscribeState();
}

class _TournamentSubscribeState extends State<TournamentSubscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header_home.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text('My Tournaments joined'),
              backgroundColor: Colors.transparent),
          body: ListView(
            children: <Widget>[
              _cardTeam(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardTeam() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.group_rounded,
            color: Colors.blue,
          ),
          title: Text('TeamMatch'),
          subtitle: Text('Jugadores experimetados para todo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ignore: deprecated_member_use
            FlatButton(onPressed: () {}, child: Text('Mas información')),
            // ignore: deprecated_member_use
            FlatButton(onPressed: () {}, child: Text('Abandonar'))
          ],
        )
      ],
    ),
  );
}

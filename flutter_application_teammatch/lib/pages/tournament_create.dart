import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/pages/addTournament_page.dart';

class TournamentCreate extends StatefulWidget {
  @override
  _TournamentCreateState createState() => _TournamentCreateState();
}

class _TournamentCreateState extends State<TournamentCreate> {
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
              title: Text('My Tournaments Created'),
              backgroundColor: Colors.transparent),
          body: ListView(
            children: <Widget>[
              _cardTeam(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTournament()));
            },
            child: Icon(Icons.group_add),
            backgroundColor: Colors.grey,
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

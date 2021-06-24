import 'package:flutter/material.dart';

class AddTournament extends StatefulWidget {
  @override
  _AddTournamentState createState() => _AddTournamentState();
}

class _AddTournamentState extends State<AddTournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        children: <Widget>[
          _addTournament(),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

Widget _addTournament() {
  return Card(
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.group_rounded,
            color: Colors.blue,
          ),
          title: Text('TeamMatch'),
          subtitle: Text('Jugadores experimetados para todo'),
        )
      ],
    ),
  );
}

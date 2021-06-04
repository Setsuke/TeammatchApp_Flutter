import 'package:flutter/material.dart';

//En desarrollo
class AddTeamPage extends StatefulWidget {
  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        children: <Widget>[
          _addTeam(),
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

  Widget _addTeam() {
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
}

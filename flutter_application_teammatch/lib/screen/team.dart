import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTeam(),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group_add),
        onPressed: () {
          setState(() {});
        },
      ),
    );
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
              FlatButton(onPressed: () {}, child: Text('Borrar'))
            ],
          )
        ],
      ),
    );
  }
}

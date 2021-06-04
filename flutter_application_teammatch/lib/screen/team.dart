import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/pages/addTeam_page.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
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
              title: Text('My Teams'), backgroundColor: Colors.transparent),
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
                  MaterialPageRoute(builder: (context) => AddTeamPage()));
            },
            child: Icon(Icons.group_add),
            backgroundColor: Colors.grey,
          ),
        ),
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
              FlatButton(onPressed: () {}, child: Text('Abandonar'))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/team.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({
    Key key,
    @required this.team,
  }) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.team.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(widget.team.image_url),
                radius: 80,
              ),
              const SizedBox(height: 40),
              Text(
                widget.team.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 64),
              // ignore: deprecated_member_use
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                color: Colors.teal,
                child: Text(
                  'Team Details',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}

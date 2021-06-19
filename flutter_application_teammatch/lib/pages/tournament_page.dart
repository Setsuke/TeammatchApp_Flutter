import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/tournament.dart';
import 'package:transparent_image/transparent_image.dart';

class TournamentPage extends StatefulWidget {
  final Tournament tournament;

  const TournamentPage({
    Key key,
    @required this.tournament,
  }) : super(key: key);

  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.tournament.name),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 200),
                  child: FadeInImage.memoryNetwork(
                    width: 200,
                    fit: BoxFit.fitWidth,
                    placeholder: kTransparentImage,
                    image: widget.tournament.image_url,
                    imageErrorBuilder: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
                Text(
                  widget.tournament.name,
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
                    'Tournament Details',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
}

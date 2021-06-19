import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/constants/tournaments_api.dart';
import 'package:flutter_application_teammatch/models/tournament.dart';
import 'package:flutter_application_teammatch/pages/tournament_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class TournamentNetworkPage extends StatefulWidget {
  @override
  _TournamentNetworkPageState createState() => _TournamentNetworkPageState();
}

class _TournamentNetworkPageState extends State<TournamentNetworkPage> {
  List<Tournament> get tournaments => null;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/header_home.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Search Your New Tournament'),
          ),
          body: FutureBuilder<List<Tournament>>(
            future: TournamentsApi.getTournaments(),
            builder: (context, snapshot) {
              final tournaments = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    return buildsTournaments(tournaments);
                  }
              }
            },
          ),
        ),
      );

  Widget buildsTournaments(List<Tournament> tournaments) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          final tournament = tournaments[index];

          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TournamentPage(tournament: tournament),
                  )),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeInImage.memoryNetwork(
                          width: 80,
                          fit: BoxFit.fill,
                          placeholder: kTransparentImage,
                          image: tournament.image_url,
                          imageErrorBuilder: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  trailing: FaIcon(FontAwesomeIcons.arrowRight),
                  title: Text(tournament.name),
                  subtitle: Text(tournament.slug),
                ),
              ],
            ),
          );
        },
      );
}

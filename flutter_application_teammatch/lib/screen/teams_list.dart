import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:flutter_application_teammatch/utils/db_helper.dart';
import 'package:flutter_application_teammatch/utils/http_helper.dart';

class MovieList extends StatefulWidget {
  final String urlOption;

  MovieList(this.urlOption);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  //late List movies;
  late Future<List?> futureMovies;
  late HttpHelper httpHelper;

  @override
  void initState() {
    httpHelper = HttpHelper();
    futureMovies = initialize(widget.urlOption);
    super.initState();
  }

  Future<List?> initialize(String urlOption)  {
    return httpHelper.getTeams(urlOption);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List?>(
      future: futureMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return TeamRow(snapshot.data?[index]);
              });
        } else if (snapshot.hasError) {
          Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class TeamRow extends StatefulWidget {
  final Team team;
  TeamRow(this.team);

  @override
  _MovieRowState createState() => _MovieRowState();
}

class _MovieRowState extends State<TeamRow> {
  late bool myteam;
  late DbHelper dbHelper;

  Future isMyTeam() async {
    await dbHelper.openDb();
    final result = await dbHelper.isMyteam(widget.team);
    setState(() {
      myteam = result;
    });
  }

  @override
  void initState() {
    myteam = false;
    dbHelper = DbHelper();
    isMyTeam();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        title: Text(
          widget.team.name,
          maxLines: 1,
        ),
        subtitle: Text(
          widget.team.name,
          maxLines: 1,
        ),
        trailing: IconButton(
          onPressed: () {
            myteam
                ? dbHelper.deleteTeam(widget.team)
                : dbHelper.insertTeam(widget.team);
            setState(() {
              myteam = !myteam;
            });
          },
          color: myteam ? Colors.red : Colors.grey,
          icon: Icon(Icons.favorite),
        ),
      ),
    );
  }
}

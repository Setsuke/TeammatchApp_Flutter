import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:flutter_application_teammatch/utils/db_helper.dart';

class MyTeamList extends StatefulWidget {
  @override
  _MyTeamListState createState() => _MyTeamListState();
}

class _MyTeamListState extends State<MyTeamList> {
  //late List teams;
  late Future<List> futureTeams;
  late DbHelper dbHelper;

  @override
  void initState() {
    dbHelper = DbHelper();
    futureTeams = allTeams();
    super.initState();
    //allTeams();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: futureTeams,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return MyTeamRow(snapshot.data?[index], dbHelper);
                });
          } else if (snapshot.hasError) {
            return Text('$snapshot.error');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List> allTeams() async {
    await dbHelper.openDb();
    return dbHelper.allTeams();
  }

}

class MyTeamRow extends StatelessWidget {
  final Team team;
  final DbHelper dbHelper;

  MyTeamRow(this.team, this.dbHelper);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(team.name),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            dbHelper.deleteTeam(team);
          },
        ),
      ),
    );
  }
}

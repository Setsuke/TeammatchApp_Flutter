import 'package:flutter_application_teammatch/models/team.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  final String name = "teammatch.db";
  Database? db;

  static final DbHelper _dbHelper = DbHelper._interal();

  DbHelper._interal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database?> openDb() async {
    if (db == null) {
      db = await openDatabase(
        join(await getDatabasesPath(), name),
        onCreate: (database, version) {
          database.execute(
            'CREATE TABLE teams(id INTEGER PRIMARY KEY, title TEXT, overview TEXT, path TEXT)',
          );
        },
        version: version,
      );
    }
    return db;
  }

  Future insertTeam(Team team) async {
    int result = await db!.insert(
      'teams',
      team.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future deleteTeam(Team team) async {
    int result = await db!.delete(
      'teams',
      where: 'id= ?',
      whereArgs: [team.id],
    );
    return result;
  }

  Future<List> allTeams() async {
    final teamsMap = await db!.query('teams');
    List teams = teamsMap.map((map) => Team.fromMap(map)).toList();
    print('Teams: ${teams.length}');
    return teams;
  }

  Future<bool> isMyteam(Team team) async {
    final teamsMap =
        await db!.query('teams', where: 'id = ?', whereArgs: [team.id]);
    return teamsMap.length > 0;
  }
}

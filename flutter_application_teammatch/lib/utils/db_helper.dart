import 'package:flutter/material.dart';
import 'package:flutter_application_teammatch/models/team.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  final String name = "Teammatch.db";
  DataTable? db;

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
            'CREATE TABLE movies(id INTEGER PRIMARY KEY, title TEXT, overview TEXT, path TEXT)',
          );
        },
        version: version,
      );
    }
    return db;
  }

  Future insertMovie(Team team) async {
    int result = await db!.insert(
      'teams',
      team.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future deleteMovie(Team team) async {
    int result = await db!.delete(
      'movies',
      where: 'id= ?',
      whereArgs: [team.id],
    );
    return result;
  }

  Future<List> allMovies() async {
    final moviesMap = await db!.query('movies');
    List movies = moviesMap.map((map) => Team.fromMap(map)).toList();
    print('Movies: ${movies.length}');
    return movies;
  }

  Future<bool> isFavorite(Team team) async {
    final teamsMap =
        await db!.query('movies', where: 'id = ?', whereArgs: [team.id]);
    return teamsMap.length > 0;
  }
}

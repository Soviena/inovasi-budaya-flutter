import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'session.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE sessions (
            id INTEGER PRIMARY KEY,
            email TEXT,
            uid INTEGER,
            loggedin TEXT,
            name TEXT,
            profilePic TEXT,
            dob TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveSession(
      String email, int uid, String profilePic, String name, String dob) async {
    final db = await instance.database;
    await db.insert('sessions', {
      'email': email,
      'uid': uid,
      'loggedin': true,
      'name': name,
      'profilePic': profilePic,
      'dob': dob
    });
  }

  Future<bool> getLogin() async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
    if (result.isNotEmpty) {
      return result.first['loggedin'] == '1';
    }
    return false;
  }

  Future<void> deleteSession() async {
    final db = await instance.database;
    await db.delete('sessions');
  }

  Future<dynamic> getSession() async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<dynamic> updateSession(
      String email, String name, String dob, String profilepic, int uid) async {
    final db = await instance.database;
    await db.update(
        'sessions',
        {
          'email': email,
          'uid': uid,
          'loggedin': true,
          'name': name,
          'profilePic': profilepic,
          'dob': dob
        },
        where: "uid = ?",
        whereArgs: [uid]);
  }
}

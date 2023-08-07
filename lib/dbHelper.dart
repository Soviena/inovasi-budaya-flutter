// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:universal_html/html.dart'
    as html; // Import the universal_html package

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
    String path = "";
    if (kIsWeb) {
      path =
          'my_web_web.db'; // You can use any string here since it's not used on the web.
      return await openDatabase(
          path); // Return an empty database instance for web.
    } else {
      if (kDebugMode) {
        print("Database inititalized for android");
      }
      path = join(await getDatabasesPath(), 'session.db');
      return await openDatabase(path, version: 1,
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
      });
    }
  }

  Future<void> saveSession(String email, String uid, String profilePic,
      String name, String dob) async {
    if (kIsWeb) {
      final sessionData = {
        'email': email,
        'uid': uid,
        'loggedin': "true",
        'name': name,
        'profilePic': profilePic,
        'dob': dob,
      };
      // Store the session data in local storage
      html.window.localStorage['session'] = jsonEncode(sessionData);
    } else {
      final db = await instance.database;
      await db.insert('sessions', {
        'email': email,
        'uid': uid,
        'loggedin': "true",
        'name': name,
        'profilePic': profilePic,
        'dob': dob,
      });
      if (kDebugMode) {
        print("user session saved");
      }
    }
  }

  Future<bool> getLogin() async {
    if (kIsWeb) {
      var sessionData = html.window.localStorage['session'];
      if (sessionData != null) {
        var session = jsonDecode(sessionData);
        return session['loggedin'] == 'true';
      }
      return false;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
      if (result.isNotEmpty) {
        return result.first['loggedin'] == 'true';
      }
      return false;
    }
  }

  Future<void> deleteSession() async {
    if (kIsWeb) {
      // Remove the session data from local storage
      html.window.localStorage.remove('session');
    } else {
      final db = await instance.database;
      await db.delete('sessions');
    }
  }

  Future<dynamic> getSession() async {
    if (kIsWeb) {
      var sessionData = html.window.localStorage['session'];
      if (sessionData != null) {
        return jsonDecode(sessionData);
      }
      return null;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
      if (result.isNotEmpty) {
        return result.first;
      }
      return null;
    }
  }

  Future<dynamic> getUid() async {
    dynamic data = await getSession();
    return data['uid'];
  }

  Future<dynamic> updateSession(String email, String name, String dob,
      String profilepic, String uid) async {
    if (kIsWeb) {
      final sessionData = {
        'email': email,
        'uid': uid,
        'loggedin': "true",
        'name': name,
        'profilePic': profilepic,
        'dob': dob,
      };
      // Update the session data in local storage
      html.window.localStorage['session'] = jsonEncode(sessionData);
    } else {
      final db = await instance.database;
      await db.update(
          'sessions',
          {
            'email': email,
            'uid': uid,
            'loggedin': "true",
            'name': name,
            'profilePic': profilepic,
            'dob': dob
          },
          where: "uid = ?",
          whereArgs: [uid]);
    }
  }
}

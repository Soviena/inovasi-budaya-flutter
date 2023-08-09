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
              dob TEXT,
              verified TEXT
            )
          ''');
        await db.execute('''
          CREATE TABLE budaya (
            id INTEGER PRIMARY KEY,
            judul TEXT,
            deskripsi TEXT,
            tanggal TEXT,
            updated TEXT NULLABLE
          )
      ''');
        await db.execute('''
          CREATE TABLE notification (
            id INTEGER PRIMARY KEY,
            judul TEXT,
            deskripsi TEXT
          )
      ''');
      });
    }
  }

  Future<void> addNotification(int id, String judul, String desc) async {
    if (kIsWeb) {
      if (kDebugMode) {
        print("Not implemented for web");
      }
    } else {
      final db = await instance.database;
      await db.insert(
          'notification',
          {
            'id': id,
            'judul': judul,
            'deskripsi': desc,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<bool> getNotificationExist(int id) async {
    if (kIsWeb) {
      if (kDebugMode) {
        print("Not implemented for web");
      }
      return false;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('notification',
          where: 'id = ?', whereArgs: [id], limit: 1);
      if (result.isNotEmpty) {
        return true;
      }
      return false;
    }
  }

  Future<void> saveBudaya(
      int id, String judul, String desc, String tanggal, String updated) async {
    if (kIsWeb) {
      if (kDebugMode) {
        print("Not implemented for web");
      }
    } else {
      final db = await instance.database;
      await db.insert(
          'budaya',
          {
            'id': id,
            'judul': judul,
            'deskripsi': desc,
            'tanggal': tanggal,
            'updated': updated,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<dynamic> getAllBudaya() async {
    if (kIsWeb) {
      return null;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('budaya');
      if (result.isNotEmpty) {
        return result;
      }
      return null;
    }
  }

  Future<dynamic> getAllbudayaThisYear() async {
    if (kIsWeb) {
      return null;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('budaya',
          where: 'tanggal LIKE ?', whereArgs: ['${DateTime.now().year}%']);
      if (result.isNotEmpty) {
        return result;
      }
      return null;
    }
  }

  Future<dynamic> getBudaya(int id) async {
    if (kIsWeb) {
      return null;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result =
          await db.query('budaya', where: 'id = ?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return result;
      }
      return null;
    }
  }

  Future<dynamic> getBudayaNow() async {
    if (kIsWeb) {
      return null;
    } else {
      final db = await instance.database;
      List<Map<String, dynamic>> result = await db.query('budaya',
          where: 'tanggal = ? ',
          whereArgs: [
            '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, "0")}'
          ]);
      if (result.isNotEmpty) {
        return result;
      }
      return null;
    }
  }

  Future<void> saveSession(String email, String uid, String profilePic,
      String name, String dob, String verified) async {
    if (kIsWeb) {
      final sessionData = {
        'email': email,
        'uid': uid,
        'loggedin': "true",
        'name': name,
        'profilePic': profilePic,
        'dob': dob,
        'verified': verified
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
        'verified': verified
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
      String profilepic, String uid, String verified) async {
    if (kIsWeb) {
      final sessionData = {
        'email': email,
        'uid': uid,
        'loggedin': "true",
        'name': name,
        'profilePic': profilepic,
        'dob': dob,
        'verified': verified
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
            'dob': dob,
            'verified': verified
          },
          where: "uid = ?",
          whereArgs: [uid]);
    }
  }
}

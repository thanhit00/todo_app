import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static final int _versoin =1;
  static final String _tableName="tasks";


  static Future<void> initDb()async{
    if(_db != null){
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
          _path,
          version: _versoin,
          onCreate: (db, version) {
            print("creating a new one");
            return db.execute(
              "CREATE TABLE $_tableName("
                  "id INTERGER PRIMARY KEY AUTOINCERMENT, "
                  "title STRING, note TEXT, date STRING, "
                  "startTime STRING, endTime STRING, "
                  "remind INTERGER, repeat STRING, "
                  "color INTERGER, "
                  "isCompleted INTERGER)",

            );
          },
      );
    } catch(e){
      print(e);

    }
  }

  static Future<int> insert(Task? task) async{
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson())??1;
  }

// Thành

}
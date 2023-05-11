import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbHelper {
  Database? database;

  // check database is created or nor ?
  Future<Database?> checkDB() async {
    if (database == null) {
      return await createDB();
    } else {
      return database;
    }
  }

  // creating database
  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'tab1.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            'CREATE TABLE incomeexpense (id INTEGER PRIMARY KEY AUTOINCREMENT,payType TEXT ,category TEXT,amount TEXT,notes TEXT,date TEXT,time Text,status INTEGER)';
        db.execute(query);
      },
    );
  }

  // insertdata in table
  Future<void> insertData({
    required category,
    required amount,
    required notes,
    required status,
    required payType,
    required date,
    required time,
  }) async {

    database = await checkDB();
    database!.insert('incomeexpense', {
      'category':category,
      'amount':amount,
      'notes':notes,
      'status':status,
      'payType':payType,
      'date':date,
      'time':time,
    });

  }
}

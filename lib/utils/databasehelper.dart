import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper
{
  Database? database;
  // TODO check database
  Future<Database?> checkDatabase()
  async {
    if(database==null)
      {
        return await createDatabase();
      }
    else
      {
        return database;
      }
  }


  // TODO create database
  Future<Future<Database>> createDatabase()
  async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'tab2.db');
    return openDatabase(path,version: 1,onCreate: (db, version) {
      String sql = 'CREATE TABLE transaction (id INTEGER PRIMARY KEY AUTOINCREMENT,amount TEXT,category TEXT,note TEXT,date TEXT,time TEXT,status INTEGER)';
      db.execute(sql);
    },);
  }


  // TODO insert database
  Future<void> insertDatabase({required category,required note,required date,required time,required status})
  async {
    database = await checkDatabase();
    database!.insert('transaction', {'category':category,'note':note,'date':date,'time':time,'status':status});
  }


  // TODO read database
  Future<List<Map>> readDatabase()
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM transaction';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }


}
import 'dart:io';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? database;
  TransactionController transactioncontroller = Get.put(TransactionController());
  HomeController homeController = Get.put(HomeController());
  // TODO check database
  Future<Database?> checkDatabase() async {
    if (database == null) {
      return await createDatabase();
    } else {
      return database;
    }
  }

  // TODO create database
  Future<Database> createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'table2.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpense(id INTEGER PRIMARY KEY AUTOINCREMENT,amount TEXT,category TEXT,note TEXT,date TEXT,time TEXT,status INTEGER,paytype TEXT)";
        db.execute(query);
      },
    );
  }

  // TODO insert database
  Future<void> insertDatabase(
      {required category,
      required note,
      required paytype,
      required date,
      required time,
      required status,
      required amount}) async {
    database = await checkDatabase();
    database!.insert("incomeexpense", {
      'category': category,
      'note': note,
      'date': date,
      'time': time,
      'status': status,
      'amount':amount,
      'paytype':paytype,
    });
    print('inserted database========');
  }

  // TODO read database
  Future<List<Map>> readDatabase() async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  // TODO delete database
  Future<void> deleteDatabase({required id})
  async {
    database = await checkDatabase();
    database!.delete('incomeexpense',where: "id=?",whereArgs: [id]);
  }

  //TODO decending data
  Future<List<Map>> decendingDatabase()
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense ORDER BY id DESC';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  //TODO decending data
  Future<List<Map>> acendingDatabase()
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense ORDER BY id ASC';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  // TODO Filter data
  Future<List<Map>> incomeExpenseFilter({required s1})
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense WHERE status = $s1';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }



}

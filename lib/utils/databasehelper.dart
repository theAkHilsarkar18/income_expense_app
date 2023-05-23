import 'dart:io';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? database;
  TransactionController transactioncontroller =
      Get.put(TransactionController());
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
            "CREATE TABLE incomeexpense(id INTEGER PRIMARY KEY AUTOINCREMENT,amount INTEGER,category TEXT,note TEXT,date TEXT,time TEXT,status INTEGER,paytype TEXT,image TEXT,month INTEGER)";
        String categoryQuery = 'CREATE TABLE categorytable(id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT)';
        db.execute(query);
        db.execute(categoryQuery);
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
      required amount,
      required image,
      required month,
      }) async {
    database = await checkDatabase();
    database!.insert("incomeexpense", {
      'category': category,
      'note': note,
      'date': date,
      'time': time,
      'status': status,
      'amount': amount,
      'paytype': paytype,
      'image' : image,
      'month' : month
    });
    print('inserted database========');
  }

  //TODO Insert data in category
  Future<void> insertCategory({required category})
  async {
    database = await checkDatabase();
    database!.insert('categorytable', {'category':category});
  }

  // TODO read database
  Future<List<Map>> readDatabase() async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }
  // TODO read category
  Future<List<Map>> readCategory()
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM categorytable';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  //TODO total income
  Future<List<Map>> totalIncome()
  async {
    database = await checkDatabase();
    String sql = 'SELECT SUM(amount) FROM incomeexpense WHERE status=1';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }
  //TODO total expanse
  Future<List<Map>> totalExpanse()
  async {
    database = await checkDatabase();
    String sql = 'SELECT SUM(amount) FROM incomeexpense WHERE status=0';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  //TODO Month wise filter
  Future<List<Map>> monthFilter(int month)
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense WHERE month="${month}"';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  // TODO delete database
  Future<void> deleteDatabase({required id}) async {
    database = await checkDatabase();
    database!.delete('incomeexpense', where: "id=?", whereArgs: [id]);
  }
  // TODO delete Category database
  Future<void> deleteCategory()
  async {
    database = await checkDatabase();
    database!.delete('categorytable');
  }


  // TODO Filter data
  Future<List<Map>> incomeExpenseFilter({required s1}) async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense WHERE status = $s1';
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  //TODO UPDATE DATABASE

  Future<void> updateDatabase(
      {required category,
      required id,
      required note,
      required paytype,
      required date,
      required time,
      required status,
      required amount,
        required image,
      }) async {
    database = await checkDatabase();
    database!.update(
        'incomeexpense',
        {
          'category': category,
          'note': note,
          'date': date,
          'time': time,
          'status': status,
          'amount': amount,
          'paytype': paytype,
          'image': image,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  // TODO MASTER FILTER

  Future<List<Map>> masteFilter({start,end})
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense WHERE date BETWEEN "$start" AND "$end"';
    List<Map> list = await database!.rawQuery(sql);
    print('${list}================');
    return list;
  }

  //TODO CATEGORY FILTER
  Future<List<Map>> categoryFilter(String category)
  async {
    database = await checkDatabase();
    String sql = 'SELECT * FROM incomeexpense WHERE category="${category}"';
    List<Map> list = await database!.rawQuery(sql);
    print('${list}================');
    return list;
  }
}

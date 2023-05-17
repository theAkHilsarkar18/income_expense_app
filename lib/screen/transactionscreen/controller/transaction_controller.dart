import 'package:get/get.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/insertscreen/model/insermodel.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:income_expense_app/utils/dbhelper.dart';

class TransactionController extends GetxController
{

  RxList<Map> transactionList = <Map>[].obs;
  RxInt fliter = 2.obs;

  // read transaction
  Future<void> readTransaction()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.readDatabase();
    print('${transactionList.length}====');
  }

  // delete database
  void deleteTransaction(int id)
  {
    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.deleteDatabase(id: id);
    readTransaction();
    print('--------------');
  }

  // decending data base
  Future<void> readDecending()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.decendingDatabase();
  }
  // acending
  Future<void> readAcending()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.acendingDatabase();
  }

  // income expense filter

  Future<void> readIncomeExpense(int status)
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.incomeExpenseFilter(s1: status);
  }

}
import 'package:get/get.dart';
import 'package:income_expense_app/screen/insertscreen/model/insermodel.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:income_expense_app/utils/dbhelper.dart';

class TransactionController extends GetxController
{
  RxList<Map> transactionList = <Map>[].obs;
  RxInt fliter = 2.obs;
  Future<void> readTransaction()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.readDatabase();
  }

}
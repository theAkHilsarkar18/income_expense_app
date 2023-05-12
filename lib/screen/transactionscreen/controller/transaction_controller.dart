import 'package:get/get.dart';
import 'package:income_expense_app/utils/dbhelper.dart';

class TransactionController extends GetxController
{
  RxList<Map> transactionList = <Map>[].obs;
  Future<void> readTransaction()
  async {
    dbHelper db = dbHelper();
    transactionList.value = await db.readData();
  }

}
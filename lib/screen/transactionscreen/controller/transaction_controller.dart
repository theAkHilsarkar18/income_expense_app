import 'package:get/get.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/insertscreen/model/insermodel.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:income_expense_app/utils/dbhelper.dart';

class TransactionController extends GetxController
{

  RxList<Map> transactionList = <Map>[].obs;
  RxList<Map> categoryList = <Map>[].obs;
  RxInt fliter = 2.obs;

  // read transaction
  Future<void> readTransaction()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.readDatabase();
    print('${transactionList.length}====');
  }
  // read category
  Future<void> readCategory()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    categoryList.value = await databaseHelper.readCategory();
    print(categoryList);
  }

  // delete database
  void deleteTransaction(int id)
  {
    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.deleteDatabase(id: id);
    readTransaction();
    print('--------------');
  }


  //TODO MASTER FILTER
  // master filter
  //String initialDate = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  Rx<DateTime?> startDate = DateTime.now().obs;
  Rx<DateTime?> endDate = DateTime.now().obs;

  Future<void> masterFilter(String start,String end)
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.masteFilter(end: end,start: start);
    print('${transactionList.value}====controller==');
  }
  Future<void> categoryFilter(String category)
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.categoryFilter(category);
  }


  // income expense filter
  Future<void> readIncomeExpense(int status)
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.incomeExpenseFilter(s1: status);
  }

  // Index of click
  RxInt index = 0.obs;

  //total income method
  RxList<Map> totalIncomeList = <Map>[].obs;
  RxList<Map> totalExpanseList = <Map>[].obs;

  Future<void> totalIncome()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    totalIncomeList.value = await databaseHelper.totalIncome();
    print("${totalIncomeList[0]['SUM(amount)']}-------------income-------------------------");


  }

  //total expanse method
  Future<void> totalExpanse()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    totalExpanseList.value = await databaseHelper.totalExpanse();
    print("${totalExpanseList[0]['SUM(amount)']}------------------expanse--------------------");
    // int income = totalIncomeList[0]['SUM(amount)'];
  }

  // month filter
  Future<void> monthFilter(int month)
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    transactionList.value = await databaseHelper.monthFilter(month);
    print(transactionList);
  }



//TODO--------------------------------------------Find category filter initialization---------------------------------------------------------------------------------------------------------------

  RxBool monthSelected = false.obs;
  RxInt monthIndex = 0.obs;
  List monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  List monthLetterList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  //TODO--------------------------------------------Find category filter initialization---------------------------------------------------------------------------------------------------------------

  RxBool categorySelected = false.obs;
  RxInt categoryIndex = 0.obs;

}
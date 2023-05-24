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
  RxInt income = 0.obs;
  RxInt expanse = 0.obs;
  RxList<Map> totalIncomeList = <Map>[].obs;
  RxList<Map> totalExpanseList = <Map>[].obs;

  Future<void> totalIncome()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    totalIncomeList.value = await databaseHelper.totalIncome();
    income.value = totalIncomeList[0]['SUM(amount)']==null?0:totalIncomeList[0]['SUM(amount)'];

  }

  //total expanse method
  Future<void> totalExpanse()
  async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    totalExpanseList.value = await databaseHelper.totalExpanse();
    expanse.value = totalExpanseList[0]['SUM(amount)']==null?0:totalExpanseList[0]['SUM(amount)'];
    // int income = totalIncomeList[0]['SUM(amount)'];
  }

  // total income expanse filter snackbar
  RxInt incomeSnackbar = 0.obs;
  RxInt expanseSnackbar = 0.obs;
  Future<void> totalSnackbar()
  async {
    for(int i=0; i<transactionList.length; i++)
      {
        if(transactionList[i]['status']==1)
          {
            int amount = transactionList[i]['amount'];
            incomeSnackbar.value = incomeSnackbar.value + amount;
          }
        else
          {
            int amount = transactionList[i]['amount'];
            expanseSnackbar.value = expanseSnackbar.value + amount;
          }
        print(incomeSnackbar);
        print(expanseSnackbar);

      }
    print(incomeSnackbar.value);
    print(expanseSnackbar.value);
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
import 'package:get/get.dart';
import 'package:income_expense_app/utils/shrhelper.dart';

import '../../transactionscreen/controller/transaction_controller.dart';

class HomeController extends GetxController
{
  RxInt totalBalance = 0.obs;
  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;
  TransactionController transactioncontroller = Get.put(TransactionController());
  // Future<void> getBalanceCard()
  // async {
  //   SharedPreferenceBalance s1 = SharedPreferenceBalance();
  //   Map m1 = await s1.readBalanceCard();
  //   totalBalance = m1['total'].obs;
  //   totalIncome = m1['income'].obs;
  //   totalExpense = m1['expense'].obs;
  //   print('${totalBalance}======balance========');
  // }

  // TODO FOR total balance and income expense
  void balaceUpdate()
  {
    int i = 0;
    for( i=0; i<transactioncontroller.transactionList.length; i++)
    {
      int status = int.parse(transactioncontroller.transactionList[i]['status']);
      if(status==1)
      {
        int amount = int.parse(transactioncontroller.transactionList[i]['amount']);
        totalBalance.value = totalBalance.value + amount;
        totalIncome.value = totalIncome.value + amount;
      }
      else
      {
        int amount = int.parse(transactioncontroller.transactionList[i]['amount']);
        totalBalance.value = totalBalance.value - amount;
        totalExpense.value = totalExpense.value + amount;
      }
    }
  }
}
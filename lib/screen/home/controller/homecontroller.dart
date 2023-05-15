import 'package:get/get.dart';
import 'package:income_expense_app/utils/shrhelper.dart';

class HomeController extends GetxController
{
  RxInt totalBalance = 0.obs;
  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;
  // Future<void> getBalanceCard()
  // async {
  //   SharedPreferenceBalance s1 = SharedPreferenceBalance();
  //   Map m1 = await s1.readBalanceCard();
  //   totalBalance = m1['total'].obs;
  //   totalIncome = m1['income'].obs;
  //   totalExpense = m1['expense'].obs;
  //   print('${totalBalance}======balance========');
  // }

}
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceBalance
{
  Future<void> createBalanceCard(int total,int income,int expense)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('total', total);
    sharedPreferences.setInt('income', income);
    sharedPreferences.setInt('expense', expense);
  }

  Future<Map> readBalanceCard()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? total = sharedPreferences.getInt('total');
    int? income = sharedPreferences.getInt('income');
    int? expense = sharedPreferences.getInt('expense');
    Map? card = {'total':total,'income':income,'expense':expense};
    return card;
  }
}

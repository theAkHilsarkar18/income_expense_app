import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/insertscreen/model/insermodel.dart';
import 'package:sizer/sizer.dart';

class InsertController extends GetxController
{
  // for change box color income to expense
  RxBool isChanged = true.obs;
  void changeBox()
  {
    isChanged.value = !isChanged.value;
  }

  // for change status income or expense 0,1 , false = expense , true = income
  RxBool status = true.obs;
  void changeStatus()
  {
    status.value = !status.value;
  }


  // category index
  RxInt categoryIndex = 0.obs;
  RxBool categorySelected = false.obs;
  // List for category

  RxList<Icon> categoryIconList  = <Icon>[
    Icon(Icons.fastfood,color: Colors.white,size: 22.sp),
    Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 22.sp),
    Icon(Icons.movie_filter,color: Colors.white,size: 22.sp),
    Icon(Icons.airplanemode_on,color: Colors.white,size: 22.sp),
    Icon(Icons.home,color: Colors.white,size: 22.sp),
    Icon(Icons.mobile_friendly_outlined,color: Colors.white,size: 22.sp),
    Icon(Icons.school,color: Colors.white,size: 22.sp),
    Icon(Icons.health_and_safety_outlined,color: Colors.white,size: 22.sp),
    Icon(Icons.monetization_on_outlined,color: Colors.white,size: 22.sp),
    Icon(Icons.electrical_services_sharp,color: Colors.white,size: 22.sp),
    Icon(Icons.ev_station_outlined,color: Colors.white,size: 22.sp),
    Icon(Icons.flatware,color: Colors.white,size: 22.sp),
    Icon(Icons.escalator_warning,color: Colors.white,size: 22.sp),
  ].obs;

  RxList categoryNameList  = [
    'Food',
    'Shopping',
    'Entertainment',
    'Travel',
    'Home Rent',
    'Recharge',
    'Education',
    'Health Care',
    'Salary',
    'Electricity Bill',
    'Fuel',
    'Grocery',
    'Pocket Money',
  ].obs;

  RxList<Color> categoryColorList = <Color>[
    Colors.amber,
    Colors.teal,
    Colors.red,
    Colors.blueAccent,
    Colors.purple,
    Colors.indigo,
    Colors.orange,
    Colors.pink,
    Colors.green,
    Colors.black,
    Colors.cyan,
    Colors.lightBlue,
    Colors.brown,
  ].obs;

  // transaction list
  RxList<InsertModel> transactionList = <InsertModel>[].obs;

  // payment type
  RxInt paytypeIndex = 0.obs;
  RxBool paytypeSelected = false.obs;

  List paytypeNameList = [
    'Cash',
    'GPay',
    'Bank Transfer',
    'Cheque',
  ].obs;

  List paytypeIconList = [
    Icon(Icons.payments_outlined,color: Colors.white,size: 25.sp),
    Icon(Icons.g_mobiledata,color: Colors.white,size: 25.sp),
    Icon(Icons.account_balance,color: Colors.white,size: 25.sp),
    Icon(Icons.money,color: Colors.white,size: 25.sp),
  ].obs;


}
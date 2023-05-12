import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/home/view/homescreen.dart';
import 'package:income_expense_app/screen/transactionscreen/view/transaction_screen.dart';

void main()
{
  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(name: '/',page: () => Homescreen(),),
        GetPage(name: '/transaction',page: () => TransactionScreen(),),
      ],
    ),
  );
}

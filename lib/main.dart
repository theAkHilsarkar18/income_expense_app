import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/graphscreen/view/graphscreen.dart';
import 'package:income_expense_app/screen/home/view/homescreen.dart';
import 'package:income_expense_app/screen/insertscreen/view/insertscreen.dart';
import 'package:income_expense_app/screen/transactionscreen/view/transaction_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/',page: () => Homescreen(),transition: Transition.downToUp,),
          GetPage(name: '/insert',page: () => Insertscreen(),transition: Transition.downToUp),
          GetPage(name: '/transaction',page: () => TransactionScreen(),transition: Transition.downToUp),
          GetPage(name: '/graph',page: () => Graphscreen(),transition: Transition.downToUp),
        ],
      ),
    ),
  );
}

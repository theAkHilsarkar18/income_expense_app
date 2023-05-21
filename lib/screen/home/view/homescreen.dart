
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/home/stateless/addbutton.dart';
import 'package:income_expense_app/screen/home/stateless/appbar.dart';
import 'package:income_expense_app/screen/home/stateless/balancecard.dart';
import 'package:income_expense_app/screen/home/stateless/listview.dart';
import 'package:income_expense_app/screen/home/stateless/navigationbar.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:income_expense_app/utils/dbhelper.dart';
import 'package:sizer/sizer.dart';

import '../../insertscreen/controller/insertcontroller.dart';
import '../../transactionscreen/controller/transaction_controller.dart';
import '../stateless/transactionbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  InsertController insertController = Get.put(InsertController());
  HomeController homeController = Get.put(HomeController());
  TransactionController transactionController = Get.put(TransactionController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.checkDatabase();
    transactionController.readTransaction();
    transactionController.totalIncome();
    transactionController.totalExpanse();
    print("${transactionController.transactionList.length}======initstate========");
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      //homeController.balaceUpdate();
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE9F0),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // appbar row
                  AppBarHomescreen(),
                  SizedBox(
                    height: 2.h,
                  ),
                  // total balance card
                  BalanceCardHomescreen(),

                  // all transactions with view all click
                 TransactionBarHomescreen(),

                  // listview of all transaction
                  ListViewHomescreen(),
                ],
              ),
            ),
            NavigationBarHomescreen(),
            AddButtonHomescreen(),
          ],
        ),

      ),

    );
  }



}

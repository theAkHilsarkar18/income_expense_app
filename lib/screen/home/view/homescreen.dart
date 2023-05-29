
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper databaseHelper = DatabaseHelper();
    databaseHelper.checkDatabase();
    transactionController.readTransaction();
    transactionController.totalIncome();
    transactionController.totalExpanse();
    homeController.userDetailFromId();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      //homeController.balaceUpdate();
      homeController.userDetailFromId();
    });
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xffEDE9F0),
              child: Column(
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 50.sp,
                      backgroundImage: NetworkImage(homeController.userData['img']==null?'https://i0.wp.com/www.wikiblogon.in/wp-content/uploads/2022/09/9-9.jpg':'${homeController.userData['img']}'),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Obx(
                    () => Text(homeController.userData['name']==null?'Anushka sen':'${homeController.userData['name']}',
                        style: GoogleFonts.poppins(
                            color: Color(0xff31435b),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp)),
                  ),
                  SizedBox(height: 2.h,),
                  Obx(() =>  Text(homeController.userData['email']==null?'anushkasen0408@gmail.com':'${homeController.userData['email']}',
                        style: GoogleFonts.poppins(
                            color: Color(0xff31435b),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp)),
                  ),

                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffEDE9F0),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // appbar row
                  InkWell(onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },child: AppBarHomescreen()),
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

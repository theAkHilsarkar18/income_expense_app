import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

class BalanceCardHomescreen extends StatelessWidget {
  const BalanceCardHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    TransactionController transactionController = Get.put(TransactionController());
    return Container(
      margin: EdgeInsets.all(10),
      height: 24.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade50,
              spreadRadius: 1,
              blurRadius: 25,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(colors: [
            // Color(0xff460C68),
            // Color(0xffCB1C8D),
            Color(0xff489ee8),
            Color(0xffcc66ff),
            Color(0xfffa9477),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total Balance',
              style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 12.sp,
                  letterSpacing: 1)),
          Obx(
                () =>  Text('\$ ${transactionController.totalIncomeList[0]['SUM(amount)']-transactionController.totalExpanseList[0]['SUM(amount)']}.00',
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 20.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // total expense amount
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                    radius: 17.sp,
                    backgroundColor: Colors.white30,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Expenses',
                          style: GoogleFonts.overpass(
                              color: Colors.white60,
                              fontSize: 9.sp,
                              letterSpacing: 1)),
                      SizedBox(
                        height: 5,
                      ),
                      Obx(
                            () =>  Text('${transactionController.totalExpanseList[0]['SUM(amount)']}.0',
                            style: GoogleFonts.overpass(
                                color: Colors.white,
                                fontSize: 12.sp,
                                letterSpacing: 1)),
                      ),
                    ],
                  ),
                ],
              ),
              // total income amount
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.green,
                      size: 20.sp,
                    ),
                    radius: 17.sp,
                    backgroundColor: Colors.white30,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Income',
                          style: GoogleFonts.overpass(
                              color: Colors.white60,
                              fontSize: 9.sp,
                              letterSpacing: 1)),
                      SizedBox(
                        height: 5,
                      ),
                      Obx(
                            () => Text('${transactionController.totalIncomeList[0]['SUM(amount)']}.0',
                            style: GoogleFonts.overpass(
                                color: Colors.white,
                                fontSize: 12.sp,
                                letterSpacing: 1)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

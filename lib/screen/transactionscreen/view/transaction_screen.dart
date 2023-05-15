import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void initState() {
    // TODO: implement initState
    transactionController.readTransaction();
    super.initState();
  }

  InsertController insertController = Get.put(InsertController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE9F0),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: GoogleFonts.poppins(
                      color: Color(0xff31435b),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      transactionController.fliter.value=2;
                    },
                    child: Text(
                      'View all',
                      style: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      //color: Colors.black12,
                      ),
                  child: transactionController.fliter.value == 1
                      ? Obx(
                          () => ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (insertController
                                        .transactionList[index].status ==
                                    true) {
                                  return transactionBox(
                                    insertController
                                        .transactionList[index].category!,
                                    insertController
                                        .transactionList[index].note!,
                                    insertController
                                        .transactionList[index].date!,
                                    insertController
                                        .transactionList[index].time!,
                                    insertController
                                        .transactionList[index].amount!,
                                    insertController.transactionList[index].i1!,
                                    insertController.transactionList[index].c1!,
                                    insertController
                                        .transactionList[index].status!,
                                  );
                                }
                                return Container();
                              },
                              itemCount:
                                  insertController.transactionList.length),
                        )
                      : transactionController.fliter.value==0?Obx(
                        () => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (insertController
                              .transactionList[index].status ==
                              false) {
                            return transactionBox(
                              insertController
                                  .transactionList[index].category!,
                              insertController
                                  .transactionList[index].note!,
                              insertController
                                  .transactionList[index].date!,
                              insertController
                                  .transactionList[index].time!,
                              insertController
                                  .transactionList[index].amount!,
                              insertController.transactionList[index].i1!,
                              insertController.transactionList[index].c1!,
                              insertController
                                  .transactionList[index].status!,
                            );
                          }
                          return Container();
                        },
                        itemCount:
                        insertController.transactionList.length),
                  ):Obx(
                        () => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return transactionBox(
                            insertController
                                .transactionList[index].category!,
                            insertController
                                .transactionList[index].note!,
                            insertController
                                .transactionList[index].date!,
                            insertController
                                .transactionList[index].time!,
                            insertController
                                .transactionList[index].amount!,
                            insertController.transactionList[index].i1!,
                            insertController.transactionList[index].c1!,
                            insertController
                                .transactionList[index].status!,
                          );
                        },
                        itemCount:
                        insertController.transactionList.length),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                height: 9.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          transactionController.fliter.value = 1;
                          insertController.changeBox();
                        },
                        child: incomeBox()),
                    InkWell(
                        onTap: () {
                          transactionController.fliter.value = 0;
                          insertController.changeBox();
                        },
                        child: expenseBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget incomeBox() {
    return Expanded(
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(5),
          height: 8.h,
          width: 43.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: insertController.isChanged.isTrue
                ? LinearGradient(colors: [
                    Color(0xff489ee8),
                    Color(0xffcc66ff),
                    Color(0xfffa9477),
                  ])
                : LinearGradient(colors: [Colors.white, Colors.white]),
          ),
          alignment: Alignment.center,
          child: insertController.isChanged.isTrue
              ? Text('Income',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ))
              : Text(
                  'Income',
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
        ),
      ),
    );
  }

  Widget expenseBox() {
    return Expanded(
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(5),
          height: 8.h,
          width: 43.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: insertController.isChanged.isFalse
                ? LinearGradient(colors: [
                    Color(0xff489ee8),
                    Color(0xffcc66ff),
                    Color(0xfffa9477),
                  ])
                : LinearGradient(colors: [Colors.white, Colors.white]),
          ),
          alignment: Alignment.center,
          child: insertController.isChanged.isFalse
              ? Text('Expense',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ))
              : Text(
                  'Expense',
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
        ),
      ),
    );
  }

  Widget transactionBox(String category, String note, String date, String time,
      String amount, Icon i1, Color c1, bool b1) {
    return Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: c1,
            child: i1,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 22.w,
                  child: Text('${category}',
                      style: GoogleFonts.poppins(
                        color: Color(0xff31435b),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ))),
              Text('${note}',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 7.sp,
                  )),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              b1
                  ? Text('-\$ ${amount}',
                      style: GoogleFonts.overpass(
                          color: Colors.green,
                          fontSize: 10.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500))
                  : Text('-\$ ${amount}',
                      style: GoogleFonts.overpass(
                          color: Colors.red,
                          fontSize: 10.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500)),
              SizedBox(
                height: 2,
              ),
              Text('${date}',
                  style: GoogleFonts.overpass(
                      color: Colors.black26, fontSize: 9.sp, letterSpacing: 1)),
              Text('${time}',
                  style: GoogleFonts.overpass(
                      color: Colors.black26, fontSize: 7.sp, letterSpacing: 1)),
            ],
          ),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
    );
  }
}

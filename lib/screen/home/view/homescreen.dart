
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:income_expense_app/utils/dbhelper.dart';
import 'package:sizer/sizer.dart';

import '../../insertscreen/controller/insertcontroller.dart';
import '../../transactionscreen/controller/transaction_controller.dart';

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
    print("${transactionController.transactionList.length}==============");
  }
  @override
  Widget build(BuildContext context) {
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 19.sp,
                        backgroundImage: AssetImage('assets/img/person.jpg'),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome !',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.blueGrey,
                                  fontSize: 8.sp,
                                  letterSpacing: 1)),
                          SizedBox(
                            height: 2,
                          ),
                          Text('Anushka Sen',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff31435b),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp)),
                        ],
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.notification_add,
                            color: Color(0xff31435b),
                            size: 18.sp,
                          )),
                      SizedBox(
                        width: 4.w,
                      ),
                    ],
                  ),
                  // total balance card
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                          () =>  Text('\$ ${homeController.totalBalance.value}.00',
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
                                      () =>  Text('${homeController.totalExpense.value}.00',
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
                                      () => Text('${homeController.totalIncome.value}.00',
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
                  ),

                  // all transactions with view all click
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
                        Text(
                          'View all',
                          style: GoogleFonts.poppins(
                            color: Colors.blueGrey,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // listview of all transaction

                  Container
                    (
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        //color: Colors.black12,
                        ),
                    child: Obx(
                      () => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            onDoubleTap: () {
                              int id = transactionController.transactionList[index]['id'];
                              transactionController.deleteTransaction(id);
                            },
                            child: transactionBox(
                              transactionController.transactionList[index]['category'],
                              transactionController.transactionList[index]['note'],
                              transactionController.transactionList[index]['date'],
                              transactionController.transactionList[index]['time'],
                              transactionController.transactionList[index]['amount'],
                              insertController.transactionList[index].i1!,
                              insertController.transactionList[index].c1!,
                              transactionController.transactionList[index]['status'],
                            ),
                          ),
                          itemCount: transactionController.transactionList.length),
                    ),
                  ),
                ],
              ),
            ),
            Align(alignment: Alignment.bottomCenter,child: navigationBar()),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Get.toNamed('/insert');
                },
                child: Container(
                  height: 16.h,
                  width: 16.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        //transform: GradientRotation(50),
                          colors: [
                            Color(0xfffa9477),
                            Color(0xffcc66ff),
                            Color(0xff489ee8),
                          ],
                      )
                  ),
                  child: Icon(Icons.add,color: Colors.white,size: 25.sp),
                ),
              ),
            ),
          ],
        ),

      ),

    );
  }

  // input output button / bottom navigation bar

  Widget navigationBar()
  {
    return Container(
      height: 9.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed('/graph');
            },
            child: Icon(
              Icons.auto_graph,
              color: Colors.blueGrey,
              size: 22.sp,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/transaction');
            },
            child: Icon(
              Icons.monetization_on_outlined,
              color: Colors.blueGrey,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }

  // transaction box
  Widget transactionBox(String category,String note,String date,String time,String amount,Icon i1,Color c1,int b1) {
    return Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
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
              b1==1?Text('\$ ${amount}',
                  style: GoogleFonts.overpass(
                      color: Colors.green,
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500)):Text('-\$ ${amount}',
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

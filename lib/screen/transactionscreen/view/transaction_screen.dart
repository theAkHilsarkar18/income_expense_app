import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/databasehelper.dart';
import '../../insertscreen/model/insermodel.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionController transactionController =
      Get.put(TransactionController());
  HomeController homeController = Get.put(HomeController());

  TextEditingController txtAmount = TextEditingController(text: '2000');
  TextEditingController txtNote = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}');
  TextEditingController txtTime = TextEditingController(
      text:
      '${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${TimeOfDay.now().hour >= 0 && TimeOfDay.now().hour <= 12 ? 'AM' : 'PM'}');


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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: GoogleFonts.poppins(
                      color: Color(0xff31435b),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 15,),
                  InkWell(onTap: () {
                    showModalBottomSheet(context: context,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
                      builder: (context) => Container(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  transactionController.readTransaction();
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color:  Color(0xff31435b),width: 2)
                                  ),
                                  child: Text(
                                    'View All',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff31435b),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  transactionController.readIncomeExpense(1);
                                  Get.back();

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color:  Color(0xff31435b),width: 2)
                                  ),
                                  child: Text(
                                    'Income',
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  transactionController.readIncomeExpense(0);
                                  Get.back();

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color:  Color(0xff31435b),width: 2)
                                  ),
                                  child: Text(
                                    'Expense',
                                    style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  transactionController.readAcending();
                                  Get.back();

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color:  Color(0xff31435b),width: 2)
                                  ),
                                  child: Text(
                                    'Acending',
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  transactionController.readDecending();
                                  Get.back();

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color:  Color(0xff31435b),width: 2)
                                  ),
                                  child: Text(
                                    'Decending',
                                    style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                    ),
                      ),);
                  },child: Icon(Icons.rule,color: Color(0xff31435b))),
                  SizedBox(width: 5,),

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
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onLongPress: () {
                            Get.defaultDialog(
                              title: 'Update',
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(onTap: () {
                                            insertController.categorySelected.value = false;
                                            insertController.categoryIndex.value = 0;
                                            Get.back();
                                          },child: Icon(Icons.close,color: Colors.blueGrey)),
                                        ),
                                      ],
                                    ),
                                    // income / expense change button
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 8.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                insertController.status.value = true;
                                                insertController.changeBox();
                                              },
                                              child: incomeBox()),
                                          InkWell(
                                              onTap: () {
                                                insertController.status.value = false;
                                                insertController.changeBox();
                                              },
                                              child: expenseBox()),
                                        ],
                                      ),
                                    ),
                                    // enter amount
                                    Container(

                                      padding: EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                                      height: 7.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: txtAmount,
                                        cursorColor: Colors.blueGrey,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey.shade300,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            letterSpacing: 1),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.attach_money,
                                            color: Colors.blueGrey,
                                            size: 20.sp,
                                          ),
                                          hintText: '1000',
                                          hintStyle:
                                          GoogleFonts.poppins(fontSize: 12.sp, letterSpacing: 1),
                                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                    // category
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(20)),
                                          builder: (context) {
                                            return GridView.builder(
                                              physics: BouncingScrollPhysics(),
                                              padding: EdgeInsets.all(20),
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,mainAxisSpacing: 20,crossAxisSpacing: 20),
                                              itemBuilder: (context, index) => InkWell(
                                                onTap: () {
                                                  insertController.categoryIndex.value = index;
                                                  insertController.categorySelected.value = true;
                                                  Get.back();
                                                },
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 22.sp,
                                                      backgroundColor: insertController.categoryColorList[index],
                                                      child: insertController.categoryIconList[index],
                                                    ),
                                                    SizedBox(height: 1.h,),
                                                    Text('${insertController.categoryNameList[index]}',style: GoogleFonts.poppins(fontSize: 9.sp)),
                                                  ],
                                                ),
                                              ),
                                              itemCount: 12,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin:
                                        EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                        padding: EdgeInsets.all(5),
                                        height: 8.h,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Icon(
                                              Icons.category,
                                              color: Colors.blueGrey,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Obx(
                                                  () => Text(
                                                insertController.categorySelected.isFalse?'Category':'${insertController.categoryNameList[insertController.categoryIndex.value]}',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueGrey.shade300,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    // note by enter value
                                    Container(
                                      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                      padding: EdgeInsets.all(5),
                                      height: 8.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: txtNote,
                                        textAlignVertical: TextAlignVertical.top,
                                        cursorColor: Colors.blueGrey,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey.shade300,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            letterSpacing: 1),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.note_alt_outlined,
                                            color: Colors.blueGrey,
                                          ),
                                          hintText: 'Note',
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.blueGrey.shade300,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              letterSpacing: 1),
                                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),

                                    // PAYMENT TYPE
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(20)),
                                          builder: (context) {
                                            return GridView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              padding: EdgeInsets.all(20),
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                                              itemBuilder: (context, index) => InkWell(
                                                onTap: () {
                                                  insertController.paytypeIndex.value = index;
                                                  insertController.paytypeSelected.value = true;
                                                  Get.back();
                                                },
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 30.sp,
                                                      backgroundColor: insertController.categoryColorList[index],
                                                      child: insertController.paytypeIconList[index],
                                                    ),
                                                    SizedBox(height: 1.h,),
                                                    Text('${insertController.paytypeNameList[index]}',style: GoogleFonts.poppins(fontSize: 9.sp)),
                                                  ],
                                                ),
                                              ),
                                              itemCount: insertController.paytypeIconList.length,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin:
                                        EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                        padding: EdgeInsets.all(5),
                                        height: 7.h,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Icon(
                                              Icons.currency_exchange,
                                              color: Colors.blueGrey,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Obx(
                                                  () => Text(
                                                insertController.paytypeSelected.isFalse?'Payment Type':'${insertController.paytypeNameList[insertController.paytypeIndex.value]}',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueGrey.shade300,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp,
                                                    letterSpacing: 1),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    // today / date
                                    Container(
                                      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                      padding: EdgeInsets.all(5),
                                      height: 8.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: txtDate,
                                        textAlignVertical: TextAlignVertical.top,
                                        cursorColor: Colors.blueGrey,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey.shade300,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            letterSpacing: 1),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.date_range,
                                            color: Colors.blueGrey,
                                            size: 18.sp,
                                          ),
                                          hintText: 'Date',
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.blueGrey.shade300,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              letterSpacing: 1),
                                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),

                                    // time box
                                    Container(
                                      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                      padding: EdgeInsets.all(5),
                                      height: 7.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: txtTime,
                                        textAlignVertical: TextAlignVertical.top,
                                        cursorColor: Colors.blueGrey,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey.shade300,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            letterSpacing: 1),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.timelapse,
                                            color: Colors.blueGrey,
                                            size: 18.sp,
                                          ),
                                          hintText: 'Time',
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.blueGrey.shade300,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              letterSpacing: 1),
                                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),


                                    // SAVE BOX
                                    InkWell(
                                      onTap: () {
                                        String category = insertController.categoryNameList[insertController.categoryIndex.value];
                                        String paytype = insertController.paytypeNameList[insertController.paytypeIndex.value];
                                        String note = txtNote.text;
                                        String date = txtDate.text;
                                        String time = txtTime.text;
                                        String amount = txtAmount.text;
                                        int amt = int.parse(amount);
                                        Icon i1 = insertController.categoryIconList[insertController.categoryIndex.value];
                                        Icon i2 = insertController.paytypeIconList[insertController.paytypeIndex.value];
                                        Color c1 = insertController.categoryColorList[insertController.categoryIndex.value];
                                        InsertModel insertmodel = InsertModel(category: category,amount: amount,c1: c1,date: date,i1: i1,status: insertController.status.value,time: time,note: note,paytype: paytype,i2: i2);
                                        insertController.transactionList.add(insertmodel);
                                        DatabaseHelper databaseHelper = DatabaseHelper();
                                        databaseHelper.insertDatabase(category: category, note: note, date: date, time: time, status: insertController.status.value==true?1:0, amount: amount,paytype: paytype);
                                        if(insertController.status.isTrue)
                                        {
                                          homeController.totalBalance.value = homeController.totalBalance.value + amt;
                                          homeController.totalIncome.value = homeController.totalIncome.value + amt;

                                        }
                                        else
                                        {
                                          homeController.totalBalance.value = homeController.totalBalance.value - amt;
                                          homeController.totalExpense.value = homeController.totalExpense.value + amt;

                                        }
                                        insertController.categorySelected.value = false;
                                        insertController.categoryIndex.value = 0;
                                        transactionController.readTransaction();
                                        ////////////////// Database insert //////////////////////
                                        // DatabaseHelper databaseHelper = DatabaseHelper();
                                        // databaseHelper.insertDatabase(category: category, note: note, date: date, time: time, status: 0);
                                        /////////////////////////////////////////////////////////////
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                                        padding: EdgeInsets.all(5),
                                        height: 5.h,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              Color(0xff489ee8),
                                              Color(0xffcc66ff),
                                              Color(0xfffa9477),
                                            ])),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Save',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                            // insertController.categoryIconList[index],
                            // insertController.categoryColorList[index],
                            transactionController.transactionList[index]['status'],
                          ),
                        );
                      },
                      itemCount:
                      transactionController.transactionList.length),
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
          height: 6.h,
          width: 29.w,
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
                    fontSize: 13.sp,
                  ))
              : Text(
                  'Income',
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
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
          height: 6.h,
          width: 29.w,
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
                    fontSize: 13.sp,
                  ))
              : Text(
                  'Expense',
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
        ),
      ),
    );
  }

  Widget transactionBox(String category, String note, String date, String time,
      String amount, Icon i1, Color c1, int b1) {
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
              b1==1
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

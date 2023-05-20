import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/insertscreen/model/insermodel.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/category.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/categorybottomsheet.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/datepicker.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/incexp.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/paytypebottomsheet.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/paytypebox.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:sizer/sizer.dart';

class Insertscreen extends StatefulWidget {
  const Insertscreen({Key? key}) : super(key: key);

  @override
  State<Insertscreen> createState() => _InsertscreenState();
}

class _InsertscreenState extends State<Insertscreen> {
  InsertController insertController = Get.put(InsertController());
  HomeController homeController = Get.put(HomeController());
  TransactionController transactionController = Get.put(TransactionController());


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

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE9F0),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
               IncomeExpenseBoxInsertScreen(),
                // enter amount
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                  height: 9.h,
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
                        fontSize: 18.sp,
                        letterSpacing: 1),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: Colors.blueGrey,
                        size: 22.sp,
                      ),
                      hintText: '1000',
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 14.sp, letterSpacing: 1),
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
                        return CategoryBottomsheet();
                      },
                    );
                  },
                  child: CategoryBoxInsertscreen(),
                ),

                // note by enter value
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                        fontSize: 15.sp,
                        letterSpacing: 1),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.note_alt_outlined,
                        color: Colors.blueGrey,
                        size: 20.sp,
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
                        return PaytypeBottomsheet();
                      },
                    );
                  },
                  child: PaytypeBoxInsertscreen(),
                ),

                // today / date
               DatepickerInserscreen(),

                // time box
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  padding: EdgeInsets.all(5),
                  height: 8.h,
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
                        fontSize: 14.sp,
                        letterSpacing: 1),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.timelapse,
                        color: Colors.blueGrey,
                        size: 20.sp,
                      ),
                      hintText: 'Time',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.blueGrey.shade300,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          letterSpacing: 1),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),

                SizedBox(height: 5.h,),

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
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    padding: EdgeInsets.all(5),
                    height: 7.h,
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
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

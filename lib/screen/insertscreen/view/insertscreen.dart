import 'package:date_format/date_format.dart';
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
import 'package:income_expense_app/screen/insertscreen/stateless/savebutton.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/timepicker.dart';
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
                        DatabaseHelper databaseHelper = DatabaseHelper();
                        databaseHelper.deleteCategory();
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
               CategoryBoxInsertscreen(),

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
               TimepickerInsertscreen(),

                SizedBox(height: 2.h,),

                // SAVE BOX
                InkWell(
                  onTap: () {
                    String category = insertController.categoryNameList[insertController.categoryIndex.value];
                    String paytype = insertController.paytypeNameList[insertController.paytypeIndex.value];
                    String note = txtNote.text;
                    String dt = '${formatDate(DateTime(insertController.pickeddate.value!.year,insertController.pickeddate.value!.month,insertController.pickeddate.value!.day),[yyyy, '-', mm, '-', dd])}';
                    String date = '${insertController.pickeddate.value!.year}-${insertController.pickeddate.value!.month}-${insertController.pickeddate.value!.day}';
                    String time = '${insertController.pickedTime.value!.hour} : ${insertController.pickedTime.value!.minute} ${insertController.pickedTime.value!.hour >= 0 && insertController.pickedTime.value!.hour <= 12 ? 'AM' : 'PM'}';
                    int amount = int.parse(txtAmount.text);
                    String image = insertController.categoryImageList[insertController.categoryIndex.value];
                    int month = insertController.pickeddate.value!.month;
                    DatabaseHelper databaseHelper = DatabaseHelper();
                    databaseHelper.insertDatabase(category: category, note: note, date: dt, time: time, status: insertController.status.value==true?1:0, amount: amount,paytype: paytype,image: image,month: month);
                    insertController.categorySelected.value = false;
                    insertController.categoryIndex.value = 0;
                    transactionController.readTransaction();
                    transactionController.totalIncome();
                    transactionController.totalExpanse();
                    Get.back();
                  },
                  child: SavebuttonInsertscreen(),
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

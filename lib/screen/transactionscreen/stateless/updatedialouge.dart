import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:income_expense_app/screen/transactionscreen/stateless/savebox.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/databasehelper.dart';
import '../../insertscreen/model/insermodel.dart';

class UpdateDialougeBoxOfTransactionscreen extends StatefulWidget {
  const UpdateDialougeBoxOfTransactionscreen({Key? key}) : super(key: key);

  @override
  State<UpdateDialougeBoxOfTransactionscreen> createState() =>
      _UpdateDialougeBoxOfTransactionscreenState();
}

class _UpdateDialougeBoxOfTransactionscreenState
    extends State<UpdateDialougeBoxOfTransactionscreen> {
  @override
  Widget build(BuildContext context) {

    TransactionController transactionController =
        Get.put(TransactionController());
    InsertController insertController = Get.put(InsertController());
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
    int index = transactionController.index.value;
    int status = transactionController.transactionList[index]['status'];
    if (status == 1) {
      insertController.isChanged.value = true;
    } else {
      insertController.isChanged.value = false;
    }
    txtAmount = TextEditingController(
        text: '${transactionController.transactionList[index]['amount']}');
    txtDate = TextEditingController(
        text: '${transactionController.transactionList[index]['date']}');
    txtTime = TextEditingController(
        text: '${transactionController.transactionList[index]['time']}');
    txtNote = TextEditingController(
        text: '${transactionController.transactionList[index]['note']}');
    return Container(
      height: 300,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // close button
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      insertController.categorySelected.value = false;
                      insertController.categoryIndex.value = 0;
                      Get.back();
                    },
                    child: Icon(Icons.close, color: Colors.blueGrey)),
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
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
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
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
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
                            backgroundColor:
                                insertController.categoryColorList[index % 13],
                            child: Image.asset(
                              '${insertController.categoryImageList[index]}',
                              height: 26,
                              width: 26,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text('${insertController.categoryNameList[index]}',
                              style: GoogleFonts.poppins(fontSize: 9.sp)),
                        ],
                      ),
                    ),
                    itemCount: insertController.categoryNameList.length,
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                      insertController.categorySelected.isFalse
                          ? 'Category'
                          : '${insertController.categoryNameList[insertController.categoryIndex.value]}',
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
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
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
                            backgroundColor:
                                insertController.categoryColorList[index],
                            child: insertController.paytypeIconList[index],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text('${insertController.paytypeNameList[index]}',
                              style: GoogleFonts.poppins(fontSize: 9.sp)),
                        ],
                      ),
                    ),
                    itemCount: insertController.paytypeIconList.length,
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                      insertController.paytypeSelected.isFalse
                          ? 'Payment Type'
                          : '${insertController.paytypeNameList[insertController.paytypeIndex.value]}',
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
              int id = transactionController.transactionList[index]['id'];
              String category = insertController
                  .categoryNameList[insertController.categoryIndex.value];
              String paytype = insertController
                  .paytypeNameList[insertController.paytypeIndex.value];
              String note = txtNote.text;
              String date = txtDate.text;
              String time = txtTime.text;
              int amount = int.parse(txtAmount.text);
              String image = insertController
                  .categoryImageList[insertController.categoryIndex.value];
              print('$image=======update dialouge');
              DatabaseHelper databaseHelper = DatabaseHelper();
              databaseHelper.updateDatabase(
                  category: category,
                  image: image,
                  note: note,
                  date: date,
                  time: time,
                  status: insertController.status.value == true ? 1 : 0,
                  amount: amount,
                  paytype: paytype,
                  id: id);

              insertController.categorySelected.value = false;
              insertController.categoryIndex.value = 0;
              transactionController.readTransaction();
              transactionController.totalIncome();
              transactionController.totalExpanse();
              Get.back();
            },
            child: SaveboxOfTransactionScreen(),
          ),
        ],
      ),
    );
  }
}

InsertController insertController = Get.put(InsertController());

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

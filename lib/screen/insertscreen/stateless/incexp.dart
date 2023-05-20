import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:sizer/sizer.dart';

class IncomeExpenseBoxInsertScreen extends StatelessWidget {
  const IncomeExpenseBoxInsertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: 10.h,
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
    );
  }
}

InsertController insertController = Get.put(InsertController());

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

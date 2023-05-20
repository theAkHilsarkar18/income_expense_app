import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/view/insertscreen.dart';
import 'package:sizer/sizer.dart';

class SavebuttonInsertscreen extends StatelessWidget {
  const SavebuttonInsertscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Insertscreen insertscreen = Get.put(Insertscreen());
    return Container(
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
    );
  }
}

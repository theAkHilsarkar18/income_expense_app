import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SaveboxOfTransactionScreen extends StatelessWidget {
  const SaveboxOfTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: 5),
      padding: EdgeInsets.all(5),
      height: 5.h,
      width:
      MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(10),
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

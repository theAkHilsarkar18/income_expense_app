import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TransactionBarHomescreen extends StatelessWidget {
  const TransactionBarHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:sizer/sizer.dart';

class PaytypeBoxInsertscreen extends StatelessWidget {
  const PaytypeBoxInsertscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
    return Container(
      margin:
      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
    );
  }
}

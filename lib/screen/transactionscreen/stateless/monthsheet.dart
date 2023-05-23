import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

import '../../insertscreen/stateless/addcategory.dart';

class Monthsheet extends StatefulWidget {
  const Monthsheet({Key? key}) : super(key: key);

  @override
  State<Monthsheet> createState() => _MonthsheetState();
}

TransactionController transactionController = Get.put(TransactionController());

class _MonthsheetState extends State<Monthsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      child: ListView.builder(
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              transactionController.monthIndex.value = index;
              transactionController.monthSelected.value = true;
              Get.back();
            },
            child: monthBox(index)),
        itemCount: 12,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }

  Widget monthBox(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 2.h,
          ),
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: insertController.categoryColorList[index % 13],
            child: Text('${transactionController.monthLetterList[index]}',
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text('${transactionController.monthList[index]}',
              style: GoogleFonts.poppins(fontSize: 9.sp)),
        ],
      ),
    );
  }
}

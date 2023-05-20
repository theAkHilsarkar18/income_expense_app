import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:sizer/sizer.dart';

class PaytypeBottomsheet extends StatelessWidget {
  const PaytypeBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
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
  }
}

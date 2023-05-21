import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

class FindCategoryBottomsheet extends StatelessWidget {
  const FindCategoryBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
    TransactionController transactionController = Get.put(TransactionController());
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,mainAxisSpacing: 20,crossAxisSpacing: 20),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          transactionController.categoryIndex.value = index;
          transactionController.categorySelected.value = true;
          Get.back();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 22.sp,
              backgroundColor: insertController.categoryColorList[index%13],
              child: Image.asset('${insertController.categoryImageList[index]}',height: 26,width: 26,),
            ),
            SizedBox(height: 1.h,),
            Text('${insertController.categoryNameList[index]}',style: GoogleFonts.poppins(fontSize: 9.sp)),
          ],
        ),
      ),
      itemCount: insertController.categoryNameList.length,
    );
  }
}

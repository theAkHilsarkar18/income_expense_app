import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/insertscreen/stateless/addcategory.dart';
import 'package:sizer/sizer.dart';

import 'categorybottomsheet.dart';

class CategoryBoxInsertscreen extends StatelessWidget {
  const CategoryBoxInsertscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(20)),
          builder: (context) {
            return CategoryBottomsheet();
          },
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin:
              EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
              padding: EdgeInsets.all(5),
              height: 8.h,
              width: 100,
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
                      insertController.categorySelected.isFalse?'Category':'${insertController.categoryNameList[insertController.categoryIndex.value]}',
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
          AddCategoryInsertscreen(),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:income_expense_app/utils/databasehelper.dart';
import 'package:sizer/sizer.dart';

import '../controller/insertcontroller.dart';

class AddCategoryInsertscreen extends StatelessWidget {
  const AddCategoryInsertscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionController transactionController = Get.put(TransactionController());
    InsertController insertController = Get.put(InsertController());
    TextEditingController txtCategory = TextEditingController();
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'Add Category',
          titleStyle: TextStyle(color: Colors.blueGrey, letterSpacing: 1),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                padding: EdgeInsets.all(5),
                height: 8.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: TextField(
                  controller: txtCategory,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: Colors.blueGrey,
                  style: GoogleFonts.poppins(
                      color: Colors.blueGrey.shade300,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      letterSpacing: 1),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.control_point_duplicate,
                      color: Colors.blueGrey,
                      size: 20.sp,
                    ),
                    hintText: 'Add Category',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        letterSpacing: 1),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                String category = txtCategory.text;
                DatabaseHelper databaseHelper = DatabaseHelper();
                databaseHelper.insertCategory(category: category);
                transactionController.readCategory();
                Timer(Duration(seconds: 2), () {
                  int index = transactionController.categoryList.length - 1;
                  print(index);
                  insertController.categoryNameList.add(transactionController.categoryList[index]['category']);
                  insertController.categoryIconList.add(Icon(Icons.category_outlined,color: Colors.white,));
                  insertController.categoryColorList.add(Colors.orange);
                  print('${insertController.categoryNameList}');
                });
                Get.back();
              },child: AddBox()),
            ],
          ),
        );
      },
      child: Container(
        height: 8.h,
        width: 8.h,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Icon(Icons.add, color: Colors.blueGrey, size: 30),
      ),
    );
  }
}

InsertController insertController = Get.put(InsertController());

Widget AddBox() {
  return Container(
    margin: EdgeInsets.all(5),
    height: 6.h,
    width: 40.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(colors: [
        Color(0xff489ee8),
        Color(0xffcc66ff),
        Color(0xfffa9477),
      ]),
    ),
    alignment: Alignment.center,
    child: Text('Add',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        )),
  );
}

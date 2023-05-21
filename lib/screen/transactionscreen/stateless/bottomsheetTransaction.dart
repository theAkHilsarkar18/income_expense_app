import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

class BottomModalSheetOfTransactionScreen extends StatelessWidget {
  const BottomModalSheetOfTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionController transactionController = Get.put(TransactionController());
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  transactionController.readTransaction();
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      border: Border.all(
                          color: Color(0xff31435b),
                          width: 2)),
                  child: Text(
                    'View All',
                    style: GoogleFonts.poppins(
                      color: Color(0xff31435b),
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  transactionController
                      .readIncomeExpense(1);
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      border: Border.all(
                          color: Color(0xff31435b),
                          width: 2)),
                  child: Text(
                    'Income',
                    style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  transactionController
                      .readIncomeExpense(0);
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      border: Border.all(
                          color: Color(0xff31435b),
                          width: 2)),
                  child: Text(
                    'Expense',
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  transactionController.readAcending();
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      border: Border.all(
                          color: Color(0xff31435b),
                          width: 2)),
                  child: Text(
                    'Acending',
                    style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  transactionController.readDecending();
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 20),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      border: Border.all(
                          color: Color(0xff31435b),
                          width: 2)),
                  child: Text(
                    'Decending',
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // TODO DATE HELPER
          Obx(
                () => Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            colorScheme: ColorScheme.light(
                              primary: Color(0xfffa9477),
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child ?? Text(""),
                        );
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );

                    transactionController.startDate.value = pickedDate;
                  },
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50),
                          border: Border.all(
                              color: Color(0xff31435b),
                              width: 2)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 3,),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Icon(Icons.calendar_today),
                          ),
                          transactionController.startDate.value==null?Text(
                            'From Date',
                            style: GoogleFonts.poppins(
                              color: Color(0xff31435b),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              letterSpacing: 1,
                            ),
                          ):Text(
                            '${transactionController.startDate.value!.day}/${transactionController.startDate.value!.month}/${transactionController.startDate.value!.year}',
                            style: GoogleFonts.poppins(
                              color: Color(0xff31435b),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
                // date time click
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            colorScheme: ColorScheme.light(
                              primary: Color(0xfffa9477),
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child ?? Text(""),
                        );
                      },
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    print(pickedDate);
                    transactionController.endDate.value = pickedDate;
                    String start = '${transactionController.startDate.value!.day}/${transactionController.startDate.value!.month}/${transactionController.startDate.value!.year}';
                    String end = '${transactionController.endDate.value!.day}/${transactionController.endDate.value!.month}/${transactionController.endDate.value!.year}';
                    print('${start}  ${end}');
                    transactionController.masterFilter(start, end);
                  },
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50),
                          border: Border.all(
                              color: Color(0xff31435b),
                              width: 2)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Icon(Icons.calendar_month_sharp),
                          ),
                          transactionController.endDate.value==null?Text(
                            'To Date',
                            style: GoogleFonts.poppins(
                              color: Color(0xff31435b),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              letterSpacing: 1,
                            ),
                          ):Text(
                            '${transactionController.endDate.value!.day}/${transactionController.endDate.value!.month}/${transactionController.endDate.value!.year}',
                            style: GoogleFonts.poppins(
                              color: Color(0xff31435b),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:income_expense_app/screen/transactionscreen/stateless/bottomsheetTransaction.dart';
import 'package:income_expense_app/screen/transactionscreen/stateless/savebox.dart';
import 'package:income_expense_app/screen/transactionscreen/stateless/updatedialouge.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/databasehelper.dart';
import '../../insertscreen/model/insermodel.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionController transactionController =
      Get.put(TransactionController());
  HomeController homeController = Get.put(HomeController());

  TextEditingController txtAmount = TextEditingController(text: '2000');
  TextEditingController txtNote = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}');
  TextEditingController txtTime = TextEditingController(
      text:
          '${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${TimeOfDay.now().hour >= 0 && TimeOfDay.now().hour <= 12 ? 'AM' : 'PM'}');

  @override
  void initState() {
    // TODO: implement initState
    transactionController.readTransaction();
    super.initState();
  }

  InsertController insertController = Get.put(InsertController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE9F0),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              alignment: Alignment.center,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: GoogleFonts.poppins(
                      color: Color(0xff31435b),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(20)),
                          builder: (context) => BottomModalSheetOfTransactionScreen(),
                        );
                      },
                      child: Icon(Icons.rule, color: Color(0xff31435b))),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),

            // all transacation controller listview
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //color: Colors.black12,
                    ),
                child: Obx(
                  () => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          // UPDATE MEHTOD CLICK
                          onTap: () {
                            transactionController.index.value = index;
                            Get.defaultDialog(
                              title: 'Update',
                              content: UpdateDialougeOfTransactionScreen(),
                            );
                          },
                          // DELETE METHOD CLICK
                          onDoubleTap: () {
                            int id = transactionController
                                .transactionList[index]['id'];
                            transactionController.deleteTransaction(id);
                            transactionController.totalIncome();
                            transactionController.totalExpanse();
                          },
                          child: transactionBox(
                            transactionController.transactionList[index]
                                ['category'],
                            transactionController.transactionList[index]
                                ['note'],
                            transactionController.transactionList[index]
                                ['date'],
                            transactionController.transactionList[index]
                                ['time'],
                            transactionController.transactionList[index]
                                ['amount'],
                            // insertController.transactionList[index].i1!,
                            // insertController.transactionList[index].c1!,
                            insertController.categoryIconList[index],
                            insertController.categoryColorList[index],
                            transactionController.transactionList[index]
                                ['status'],
                            transactionController.transactionList[index]['paytype'],
                          ),
                        );
                      },
                      itemCount: transactionController.transactionList.length),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget transactionBox(String category, String note, String date, String time,
      int amount, Icon i1, Color c1, int b1,String paytype) {
    return Container(
      height: 11.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: c1,
            child: i1,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 22.w,
                      child: Text('${category}',
                          style: GoogleFonts.poppins(
                            color: Color(0xff31435b),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ))),
                  Text('$paytype',style: TextStyle(color: c1,fontSize: 7.sp)),
                ],
              ),
              Text('${note}',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 7.sp,
                  )),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              b1 == 1
                  ? Text('-\$ ${amount}',
                  style: GoogleFonts.overpass(
                      color: Colors.green,
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500))
                  : Text('-\$ ${amount}',
                  style: GoogleFonts.overpass(
                      color: Colors.red,
                      fontSize: 10.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 2,
              ),
              Text('${date}',
                  style: GoogleFonts.overpass(
                      color: Colors.black26, fontSize: 9.sp, letterSpacing: 1)),
              Text('${time}',
                  style: GoogleFonts.overpass(
                      color: Colors.black26, fontSize: 7.sp, letterSpacing: 1)),
            ],
          ),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
    );
  }
}

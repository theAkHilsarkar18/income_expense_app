import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';
import 'package:sizer/sizer.dart';

class ListViewHomescreen extends StatelessWidget {
  const ListViewHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionController transactionController = Get.put(TransactionController());
    InsertController insertController = Get.put(InsertController());
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: Colors.black12,
      ),
      child: Obx(
            () => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onDoubleTap: () {
                int id = transactionController.transactionList[index]['id'];
                transactionController.deleteTransaction(id);
              },
              child: transactionBox(
                transactionController.transactionList[index]['category'],
                transactionController.transactionList[index]['note'],
                transactionController.transactionList[index]['date'],
                transactionController.transactionList[index]['time'],
                transactionController.transactionList[index]['amount'],
                // insertController.transactionList[index].i1!,
                // insertController.transactionList[index].c1!,
                transactionController.transactionList[index]['image'],
                insertController.categoryColorList[index%13],
                transactionController.transactionList[index]['status'],
                //insertController.transactionList[index].paytype!,
                transactionController.transactionList[index]['paytype'],
              ),
            ),
            itemCount: transactionController.transactionList.length),
      ),
    );
  }
}


// transaction box
Widget transactionBox(String category,String note,String date,String time,int amount,String img,Color c1,int b1,String paytype) {
  return Container(
    height: 11.h,
    width: double.infinity,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white70,
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
          child: Image.asset('$img',height: 26,width: 26,),
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                children: [
                  Container(
                      width: 22.w,
                      child: Text('${category}',
                          style: GoogleFonts.poppins(
                            color: Color(0xff31435b),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ))),
                  SizedBox(width: 2.w,),
                  Text('$paytype',style: TextStyle(color: c1,fontSize: 7.sp)),
                ]
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
            b1==1?Text('\$ ${amount}',
                style: GoogleFonts.overpass(
                    color: Colors.green,
                    fontSize: 10.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500)):Text('-\$ ${amount}',
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
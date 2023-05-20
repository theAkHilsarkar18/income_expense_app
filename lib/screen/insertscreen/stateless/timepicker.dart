import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:income_expense_app/screen/insertscreen/view/insertscreen.dart';
import 'package:sizer/sizer.dart';

class TimepickerInsertscreen extends StatelessWidget {
  const TimepickerInsertscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InsertController insertController = Get.put(InsertController());
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
          InkWell(
            onTap: () async {
              insertController.pickedTime.value = await showTimePicker(
                builder: (context, child) {
                  return Theme(data: ThemeData(colorScheme: ColorScheme.light(
                    primary: Color(0xfffa9477),
                    secondary: Color(0xff489ee8),
                  ),
                    dialogBackgroundColor: Colors.white,), child: child ?? Text(""),);
                },
                  context: context, initialTime: TimeOfDay.now());
            },
            child: Icon(
              Icons.timelapse,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Obx(
                () => Text(
              '${insertController.pickedTime.value!.hour} : ${insertController.pickedTime.value!.minute} ${insertController.pickedTime.value!.hour >= 0 && insertController.pickedTime.value!.hour <= 12 ? 'AM' : 'PM'}',
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

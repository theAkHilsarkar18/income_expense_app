import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/insertscreen/controller/insertcontroller.dart';
import 'package:sizer/sizer.dart';

class DatepickerInserscreen extends StatelessWidget {
  const DatepickerInserscreen({Key? key}) : super(key: key);

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
              insertController.pickeddate.value = await showDatePicker(
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.light(
                            primary: Color(0xffcc66ff),
                           ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child ?? Text(""),
                    );
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030));
            },
            child: Icon(
              Icons.calendar_month_sharp,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Obx(
            () => Text(
              '${insertController.pickeddate.value!.day}/${insertController.pickeddate.value!.month}/${insertController.pickeddate.value!.year}',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddButtonHomescreen extends StatelessWidget {
  const AddButtonHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          Get.toNamed('/insert');
        },
        child: Container(
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                //transform: GradientRotation(50),
                colors: [
                  Color(0xfffa9477),
                  Color(0xffcc66ff),
                  Color(0xff489ee8),
                ],
              )
          ),
          child: Icon(Icons.add,color: Colors.white,size: 25.sp),
        ),
      ),
    );
  }
}

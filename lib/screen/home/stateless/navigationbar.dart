import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NavigationBarHomescreen extends StatelessWidget {
  const NavigationBarHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 9.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/graph');
              },
              child: Icon(
                Icons.auto_graph,
                color: Colors.blueGrey,
                size: 22.sp,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/transaction');
              },
              child: Icon(
                Icons.monetization_on_outlined,
                color: Colors.blueGrey,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

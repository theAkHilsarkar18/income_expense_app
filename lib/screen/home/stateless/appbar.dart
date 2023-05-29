import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/screen/home/controller/homecontroller.dart';
import 'package:income_expense_app/utils/firebase_helper.dart';
import 'package:sizer/sizer.dart';

class AppBarHomescreen extends StatelessWidget {
  const AppBarHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () =>  CircleAvatar(
            radius: 19.sp,
            backgroundImage: NetworkImage(homeController.userData['img']==null?'https://i0.wp.com/www.wikiblogon.in/wp-content/uploads/2022/09/9-9.jpg':'${homeController.userData['img']}'),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome !',
                style: GoogleFonts.varelaRound(
                    color: Colors.blueGrey,
                    fontSize: 8.sp,
                    letterSpacing: 1)),
            SizedBox(
              height: 2,
            ),
            Obx(
              () => Text(homeController.userData['name']==null?'Anushka sen':'${homeController.userData['name']}',
                  style: GoogleFonts.poppins(
                      color: Color(0xff31435b),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp)),
            ),
          ],
        ),
        Spacer(),
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.notification_add,
              color: Color(0xff31435b),
              size: 18.sp,
            )),
        SizedBox(width: 4.w,),
        InkWell(
          onTap: () async {
            await FirebaseHelper.firebaseHelper.signOut();
            Get.offAndToNamed('/login');
          },
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.logout,
                color: Color(0xff31435b),
                size: 18.sp,
              )),
        ),
        SizedBox(
          width: 4.w,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppBarHomescreen extends StatelessWidget {
  const AppBarHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 19.sp,
          backgroundImage: AssetImage('assets/img/person.jpg'),
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
            Text('Anushka Sen',
                style: GoogleFonts.poppins(
                    color: Color(0xff31435b),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp)),
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
        SizedBox(
          width: 4.w,
        ),
      ],
    );
  }
}

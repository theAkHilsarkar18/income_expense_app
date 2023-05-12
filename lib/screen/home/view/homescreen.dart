import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_expense_app/utils/dbhelper.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // appbar row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 19.sp,
                      backgroundImage: AssetImage('assets/img/person.jpg'),
                    ),
                    SizedBox(width: 4.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome !',style: GoogleFonts.varelaRound(color: Colors.blueGrey,fontSize:8.sp)),
                        SizedBox(height: 2,),
                        Text('Anushka Sen',style: GoogleFonts.overpass(color: Color(0xff460C68),fontWeight:FontWeight.w500,fontSize:12.sp)),
                      ],
                    ),
                    Spacer(),
                    Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),child: Icon(Icons.notification_add,color: Color(0xff460C68),size: 18.sp,)),
                    SizedBox(width: 4.w,),
                  ],
                ),
              // total balance card
              SizedBox(height: 2.h,),
              Container(
                margin: EdgeInsets.all(10),
                height: 24.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff460C68),
                      Color(0xffCB1C8D),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Total Balance',style: GoogleFonts.overpass(color: Colors.white,fontSize: 12.sp,letterSpacing: 1)),
                    Text('\$ 48000.00',style: GoogleFonts.overpass(color: Colors.white,fontSize: 20.sp,letterSpacing: 1)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.arrow_upward_rounded,color: Colors.red,size: 20.sp,),
                              radius: 17.sp,
                              backgroundColor: Colors.white30,
                            ),
                            SizedBox(width: 4.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Expenses',style: GoogleFonts.overpass(color: Colors.white60,fontSize: 9.sp,letterSpacing: 1)),
                                SizedBox(height: 5,),
                                Text('800.00',style: GoogleFonts.overpass(color: Colors.white,fontSize: 12.sp,letterSpacing: 1)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.arrow_downward_sharp,color: Colors.green,size: 20.sp,),
                              radius: 17.sp,
                              backgroundColor: Colors.white30,
                            ),
                            SizedBox(width: 4.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Income',style: GoogleFonts.overpass(color: Colors.white60,fontSize: 9.sp,letterSpacing: 1)),
                                SizedBox(height: 5,),
                                Text('1800.00',style: GoogleFonts.overpass(color: Colors.white,fontSize: 12.sp,letterSpacing: 1)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

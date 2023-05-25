import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/firebase_helper.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding:EdgeInsets.all(50),child: Image.asset('assets/img/logo.png',)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtEmail,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(color: Colors.pink,letterSpacing: 1),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.pink)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.pink)),
                      labelText: 'Email',
                      labelStyle: GoogleFonts.overpass(color: Colors.black,letterSpacing: 1),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtPassword,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(color: Colors.pink,letterSpacing: 1),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.pink)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5,color: Colors.pink)),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.overpass(color: Colors.black,letterSpacing: 1),
                      prefixIcon: Icon(Icons.lock_outline,color: Colors.black),
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  Get.toNamed('/signup');
                }, child: Text('New user ?  Register.. ',style: GoogleFonts.overpass(color: Colors.pink,letterSpacing: 1),)),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () async {
                    String email = txtEmail.text;
                    String password = txtPassword.text;
                    bool isLogin = await FirebaseHelper.firebaseHelper.signIn(email: email, password: password);
                    if(isLogin==true)
                      {
                        Get.snackbar('Login Successful', '',backgroundColor: Colors.green.shade100);
                        Get.offAndToNamed('/home');
                      }
                    else
                      {
                        Get.snackbar('${FirebaseHelper.firebaseHelper.msg}', '',backgroundColor: Colors.red.shade100);
                      }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text('Login',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 14.sp)),
                  ),
                ),
              ],
            ),
          ),
        )
    ));
  }
}

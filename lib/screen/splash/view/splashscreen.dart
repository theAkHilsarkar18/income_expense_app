import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/utils/firebase_helper.dart';

class Spleshcreen extends StatefulWidget {
  const Spleshcreen({Key? key}) : super(key: key);

  @override
  State<Spleshcreen> createState() => _SpleshcreenState();
}

class _SpleshcreenState extends State<Spleshcreen> {

  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin = FirebaseHelper.firebaseHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 6), () {Navigator.pushReplacementNamed(context, isLogin?'login':'home');});
    return SafeArea(
      child: Scaffold(
        body: Center(child: Column(
          children: [
            Spacer(),
            Image.asset('assets/img/logo.png',height: 150,),
            Spacer(),
            LinearProgressIndicator(backgroundColor: Colors.pink.shade100,color: Colors.pink),
            // SizedBox(height: 10,),
          ],
        )),
      ),
    );
  }
}

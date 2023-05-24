import 'package:flutter/material.dart';
import 'package:income_expense_app/utils/firebase_helper.dart';

class SignUPscreen extends StatefulWidget {
  const SignUPscreen({Key? key}) : super(key: key);

  @override
  State<SignUPscreen> createState() => _SignUPscreenState();
}

class _SignUPscreenState extends State<SignUPscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseHelper.firebaseHelper.signUP(email: 'admin123@gmail.com', password: '12345678');
        }, child: Text("SignUP")),
      ),
    ));
  }
}

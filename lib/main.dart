import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/auth/signup/view/signupscreen.dart';
import 'package:income_expense_app/screen/graphscreen/view/graphscreen.dart';
import 'package:income_expense_app/screen/home/view/homescreen.dart';
import 'package:income_expense_app/screen/insertscreen/view/insertscreen.dart';
import 'package:income_expense_app/screen/splash/view/splashscreen.dart';
import 'package:income_expense_app/screen/transactionscreen/view/transaction_screen.dart';
import 'package:sizer/sizer.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/signup',
        getPages: [
          GetPage(name: '/',page: () => Spleshcreen(),transition: Transition.downToUp, ),
          GetPage(name: '/home',page: () => Homescreen(),transition: Transition.downToUp, ),
          GetPage(name: '/signup',page: () => SignUPscreen(),transition: Transition.downToUp, ),
          GetPage(name: '/insert',page: () => Insertscreen(),transition: Transition.downToUp),
          GetPage(name: '/transaction',page: () => TransactionScreen(),transition: Transition.downToUp),
          GetPage(name: '/graph',page: () => Graphscreen(),transition: Transition.downToUp),
        ],
      ),
    ),
  );
}

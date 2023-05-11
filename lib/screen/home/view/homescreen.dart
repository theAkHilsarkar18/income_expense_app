import 'package:flutter/material.dart';
import 'package:income_expense_app/utils/dbhelper.dart';

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
        body: Center(
          child: ElevatedButton(
            child: Text("Insert"),
            onPressed: () {
              dbHelper db = dbHelper();

              db.insertData(category: 'food', amount: '1000', notes: 'chill', status: 1, payType: 'online', date: '11-2-2023', time: '10:00');
            },
          ),
        ),
      ),
    );
  }
}

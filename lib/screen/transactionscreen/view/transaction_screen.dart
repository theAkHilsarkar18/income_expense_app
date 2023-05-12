import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_app/screen/transactionscreen/controller/transaction_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void initState() {
    // TODO: implement initState
    transactionController.readTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) =>
                Text("${transactionController.transactionList[index]['category']}"),
            itemCount: transactionController.transactionList.length,
          ),
        ),
      ),
    );
  }
}

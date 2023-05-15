import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../transactionscreen/controller/transaction_controller.dart';

class Graphscreen extends StatefulWidget {
  const Graphscreen({Key? key}) : super(key: key);

  @override
  State<Graphscreen> createState() => _GraphscreenState();
}

class _GraphscreenState extends State<Graphscreen> {

  TransactionController transactionController = Get.put(TransactionController());
  @override
  void initState() {
    // TODO: implement initState
    transactionController.readTransaction();
    print('read transaction==== ${transactionController.transactionList.length}');
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE9F0),
      ),
    );
  }

}

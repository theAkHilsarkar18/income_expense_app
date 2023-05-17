import 'package:flutter/cupertino.dart';

class InsertModel {
  String? category, amount, date, time, note, paytype;
  Icon? i1,i2;
  bool? status;
  Color? c1;

  InsertModel(
      {this.category,
      this.paytype,
      this.amount,
      this.date,
      this.time,
      this.note,
      this.i1,
      this.i2,
      this.status,
      this.c1});
}

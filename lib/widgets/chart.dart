import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import'package:intl/';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransacitons;
  Chart(this.recentTransacitons);

  List <Map<String,Object>> get weeklyTx {
    return List.generate(7, (index){return {'day':};});
  };
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[],
          )
        ],
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransacitons;
  Chart(this.recentTransacitons);

  List<Map<String, Object>> get weeklyTx {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        var amountSum = 0.0;
        for (var i = 0; i < recentTransacitons.length; i++) {
          if (weekday.day == recentTransacitons[i].date.day &&
              weekday.month == recentTransacitons[i].date.month &&
              weekday.year == recentTransacitons[i].date.year) {
            amountSum++;
          }
        }
        print(DateFormat.E().format(weekday));
        print(amountSum);

        return {
          'day': DateFormat.E().format(weekday),
          'amount': amountSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[],
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}

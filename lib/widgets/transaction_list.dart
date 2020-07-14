import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction>_userTransaction=[
    Transaction(
        id: "t1", title: "Starbucks Coffee", amount: 250, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Shoes", amount: 3000, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return           //For a list of Past transactions
          Column(
            children: _userTransaction.map(
              (tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "\₹ " + tx.amount.toString(),
                          style: TextStyle(
                            color: Colors.purple[400],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: EdgeInsets.all(10),

                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: Colors.grey[850], width: 2)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey[850],
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          );
}}
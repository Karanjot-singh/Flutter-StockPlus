import 'package:Xpense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import "./new_transaction.dart";
import './transaction_list.dart';

class userTransactions extends StatefulWidget {
  @override
  _userTransactionsState createState() => _userTransactionsState();
}

class _userTransactionsState extends State<userTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(), TransactionList()
    ],
      
    );
  }
}
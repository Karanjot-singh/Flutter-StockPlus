import 'package:Xpense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import "./new_transaction.dart";
import './transaction_list.dart';
import '../models/Transaction.dart';

class userTransactions extends StatefulWidget {
  @override
  _userTransactionsState createState() => _userTransactionsState();
}

class _userTransactionsState extends State<userTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: "t1", title: "Starbucks Coffee", amount: 250, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Shoes", amount: 3000, date: DateTime.now())
  ];
  void _addTransaction( String addTitle, double addAmount) {
      Transaction(
        id: "id", title: addTitle, amount: addAmount, date: DateTime.now() );
      final tx = Transaction(id: DateTime.now().toString(), title: addTitle, amount: addAmount, date: DateTime.now());
    setState(() {
      _userTransaction.add(tx);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}

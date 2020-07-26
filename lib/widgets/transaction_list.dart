import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  TransactionList(this._userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _userTransaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Transactions to display!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: 300)
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "\₹ " +
                              _userTransaction[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
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
                          Text(_userTransaction[index].title,
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                            DateFormat.yMMMd()
                                .format(_userTransaction[index].date),
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
              itemCount: _userTransaction.length,
            ),
    );
  }
}

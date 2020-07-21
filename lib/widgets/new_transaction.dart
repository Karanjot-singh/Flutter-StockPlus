import "package:flutter/material.dart";
import "../models/Transaction.dart";



class NewTransaction extends StatelessWidget {
  //For Obtainining user input
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void _addTransaction({String addTitle, double addAmount }) {
      Transaction(
        id: "id", title: addTitle, amount: addAmount, date: DateTime.now() );
    return null;
    }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              // onChanged: (value) => titleInput = value,
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              autofocus: true,
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            FlatButton(
              onPressed: ()=>_addTransaction(addTitle:titleController.toString(), addAmount: double.parse(amountController.toString()) ),
              color: Colors.purple,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      // TransactionList()
    );
  }
}

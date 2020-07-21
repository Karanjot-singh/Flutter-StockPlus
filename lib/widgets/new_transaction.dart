import "package:flutter/material.dart";
import "../models/Transaction.dart";

class NewTransaction extends StatelessWidget {
  //For Obtainining user input
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
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
              onPressed: () => {
                addTx(
                    titleController.text,
                    double.parse(
                      amountController.text,
                    ))
              },
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

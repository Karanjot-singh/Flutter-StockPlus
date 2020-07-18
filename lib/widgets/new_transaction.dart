import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  //For Obtainining user input
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
              // decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            FlatButton(
              onPressed: () {},
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

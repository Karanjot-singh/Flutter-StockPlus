import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  //For Obtainining user input
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitHandler() {
    final titleText = titleController.text;
    final amountText = double.parse(amountController.text);
    if(titleText.isEmpty || amountText<=0)
      return;
    addTx(
      titleText,
      amountText,
    );
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
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true), //for ios
              controller: amountController,
              onSubmitted: (_) => submitHandler, //arg not used
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            FlatButton(
              onPressed: submitHandler,
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

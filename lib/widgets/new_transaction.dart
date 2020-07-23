import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
  //For Obtainining user input
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitHandler() {
    final titleText = titleController.text;
    final amountText = double.parse(amountController.text);
    if(titleText.isEmpty || amountText<=0)
      return;
    //widget. to access propeperties of widget from extended state
    widget.addTx(
      titleText,
      amountText,
    );
    //to pop out modal sheet after entry
    Navigator.of(context).pop();
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
              onSubmitted: (_)=>submitHandler(),
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              autofocus: true,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true), //for ios
              controller: amountController,
              onSubmitted: (_) => submitHandler(), //arg not used
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

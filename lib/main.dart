import 'Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpense',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Starbucks Coffee", amount: 250, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Shoes", amount: 3000, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xpense"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.teal,
              elevation: 10,
              child: Text("Daily charts"),
            ),
          ),
          Card(
            child: Container(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Colors.purple,
                    child: Text("Add Transaction"),
                    
                  ),
                ],
              ),
            ),
          ),

          //For a list of Past transactions
          Column(
            children: transactions.map(
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
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

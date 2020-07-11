import 'Transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//test comment
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: transactions.map(
              (tx) {
                return Card(
                  child: Text(tx.title),
                );
              },
            ).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.red,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

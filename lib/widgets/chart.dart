import 'package:flutter/material.dart';
import '';

class Chart extends StatelessWidget {
  List <Map<String,Object>> get weeklyTx{
    return List.generate(7, (){})
  };
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[],
          )
        ],
      ),
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}

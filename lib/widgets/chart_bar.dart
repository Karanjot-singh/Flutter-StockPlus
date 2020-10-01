import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double amountValue;
  final double totalPercentTx;
  Chartbar(this.label, this.amountValue, this.totalPercentTx);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Text(
          "₹ " + amountValue.toStringAsFixed(0),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
        SizedBox(
          width: 35,
        ),
      ],
    );
  }
}

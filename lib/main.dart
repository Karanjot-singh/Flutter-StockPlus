import 'package:flutter/material.dart';
import './screens/home_screen.dart';

//39
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpense',
      theme: ThemeData(
        fontFamily: '',
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                // title deprecated to headline6
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


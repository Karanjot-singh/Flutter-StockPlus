import 'package:Xpense/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String username;

  //firebase_login
  FirebaseUser user;

  void signInHandler() {
    signInWithGoogle().then((value) => () {
          this.user = user;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        });
  }

  Widget googleLoginButton() {
    return OutlineButton(onPressed: signInHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 5,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.check_circle_outline),
                      splashColor: Colors.blue,
                      tooltip: "Enter",
                      onPressed: () {
                        this.username = usernameController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                    ),
                  )),
              TextField(
                controller: passwordController,
              ),
            ],
          ),
        ));
  }
}

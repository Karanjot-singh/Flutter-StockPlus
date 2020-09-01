import 'package:Xpense/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In",style: TextStyle(fontSize: 20),),
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
  @override
  void initState() {
    //first time after restart
    super.initState();
    signOutGoogle();
  }

  void textBoxHandler() {
    this.username = usernameController.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
  void textBoxHandler1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  void signInHandler() {
    //the return value of sign in with google comes in the user field
    signInWithGoogle().then((user) => () {
          this.user = user;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage())); //user.displayname
        });
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: signInHandler,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/images/google_logo.png'),
              height: 25,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }

  Widget signInTextBox(String username, int type) {
    return TextField(
      controller: (type == 0) ? usernameController: passwordController,
      obscureText: (type == 0) ? false : true,
      decoration: InputDecoration(
        prefixIcon: (type == 0) ? Icon(Icons.person) : Icon(Icons.lock),
        labelText: username,
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
          onPressed: (type == 0) ? textBoxHandler : textBoxHandler1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              signInTextBox("Username", 0),

              SizedBox(
                height: 15,
              ),
              signInTextBox("Password", 1),
              SizedBox(
                height: 35,
              ),
              googleLoginButton(),
            ],
          ),
        ));
  }
}

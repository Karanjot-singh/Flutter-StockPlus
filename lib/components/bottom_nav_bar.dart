import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import '../screens/home_screen.dart';
import '../screens/login_page.dart';

class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavBar();
  }
}

class BottomNavBar extends State<NavBar> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          LoginPage(),
          MyHomePage(),
          Center(
            child: Icon(
              Icons.settings,
              color: Colors.black
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.purple[800],
        itemOutlineColor: Colors.teal,
        itemBackgroudnColor: Colors.teal,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.account_circle,
            title: "Login",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.account_balance_wallet,
            title: "My Wallet",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.settings,
            title: "Settings",
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 400));
        },
      ),
    );
  }
}
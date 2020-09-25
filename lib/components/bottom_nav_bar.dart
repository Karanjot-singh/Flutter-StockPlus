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
              Icons.near_me,
              color: Color(0XFF003051),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.map,
            title: "Map",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.near_me,
            title: "Directions",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.settings,
            title: "Settings",
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 600));
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';


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
          Center(
            child: Icon(
              Icons.map,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.near_me,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.shopping_cart,
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
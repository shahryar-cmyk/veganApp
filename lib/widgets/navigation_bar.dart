import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
   int page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.green[600],
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.share,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.black,
          ),
        ],
        color: Colors.lightGreenAccent[400],
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(255, 10, 11, 0),
        animationCurve: Curves.linear,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      );
  }
}
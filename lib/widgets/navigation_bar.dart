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
    return Container(
      // color: Colors.white,
      height: 80,
      child: Column(
        children: [
          Container(
            height: 60,
            color: Colors.transparent,
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 50.0,
              items: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                // Icon(
                //   Icons.shopping_cart,
                //   size: 30,
                //   color: Colors.black,
                // ),
              ],
              color: Colors.green.shade900,
              buttonBackgroundColor: Colors.green.shade900,
              backgroundColor: Colors.white,
              animationCurve: Curves.decelerate,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  page = index;
                });
              },
            ),
          ),
          Container(
            height: 10,
            color: Colors.green.shade900,
          )
        ],
      ),
    );
  }
}

import 'package:connectivity/connectivity.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:veganapp/Web/store.dart';
import 'package:veganapp/network_provider/post.dart';
import 'package:veganapp/services/network_aware_widget.dart';
import 'package:veganapp/services/network_status_service.dart';
import 'package:veganapp/widgets/about.dart';
import 'package:veganapp/widgets/home.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottombar-screen';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _isSelectedIndex = 0;
  List<Map<String, Object>> pages;
  var subscription;
  GlobalKey _bottomNavigationKey = GlobalKey();
  void share(BuildContext ctx) {
    Share.share('This is the Example App Check it out');
  }

  @override
  void initState() {
    pages = [
      {
        'page': Home(),
        'title': 'Vegan App Home',
        'appBarTitle': 'Vegan Choice Food App',
      },
      {
        'page': StoreWeb(),
        'title': 'Store',
        'appBarTitle': 'Vegan Store',
      },
      {
        'page': About(),
        'title': 'About',
        'appBarTitle': 'About Us',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final status =
    //     Provider.of<NetworkStatusService>(context).networkStatusController;
    // print('This is the Status of Bottom Navigation $status');

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        iconTheme: new IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              icon: Icon(
                Icons.share,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                share(context);
              })
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: Icon(
          //     Icons.share,
          //     size: 30,
          //     color: Colors.white,
          //   ),
          // ),
        ],
        title: Text(
          pages[_isSelectedIndex]['appBarTitle'],
          // style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: NetworkAwareWidget(
          onlineChild: pages[_isSelectedIndex]['page'],
          offlineChild: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/Lottie/online_offline.json'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You are Offline.\n For App to Work Properly.You have to Connect to Internet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red.shade200,
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        // color: Colors.white,
        height: 80,
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.transparent,
              child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: _isSelectedIndex,
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
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.info,
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
                    _isSelectedIndex = index;
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
      ),

      // Theme(
      //   data: Theme.of(context).copyWith(
      //     // sets the background color of the `BottomNavigationBar`
      //     canvasColor: Color.fromRGBO(243, 247, 250, 1),
      //     // sets the active color of the `BottomNavigationBar` if `Brightness` is light
      //     // primaryColor: Colors.red,
      //     // textTheme: Theme.of(context)
      //     //     .textTheme
      //     //     .copyWith(caption: new TextStyle(color: Colors.yellow))
      //   ),
      //   child:
      //    BottomNavigationBar(
      //       // key: ,
      //       showUnselectedLabels: true,
      //       currentIndex: _isSelectedIndex,
      //       unselectedItemColor: Color.fromRGBO(102, 102, 102, 0.3),
      //       selectedItemColor: Colors.blue,
      //       selectedLabelStyle: TextStyle(
      //         fontFamily: 'Nunito',
      //         fontSize: 12,
      //         fontWeight: FontWeight.w800,
      //       ),
      //       unselectedLabelStyle: TextStyle(
      //         fontFamily: 'Nunito',
      //         fontSize: 12,
      //         fontWeight: FontWeight.w800,
      //       ),
      //       onTap: _selectIndex,
      //       type: BottomNavigationBarType.fixed,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             'assets/svg/Bead_unselected_tab.png',
      //             height: 50,
      //           ),
      //           activeIcon: Image.asset(
      //             'assets/svg/Bead_selected_tab.png',
      //             height: 50,
      //           ),
      //           label: 'Tasbih Tracker',

      //           // backgroundColor: Theme.of(context).primaryColor
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             'assets/svg/Time_unselected_tab.png',
      //             height: 50,
      //           ),
      //           activeIcon: Image.asset(
      //             'assets/svg/Time_selected_tab.png',
      //             height: 50,
      //           ),
      //           label: 'Prayer Time Limits',
      //           // backgroundColor: Theme.of(context).primaryColor
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             'assets/svg/Menu_unselected_tab.png',
      //             height: 50,
      //           ),
      //           activeIcon: Image.asset(
      //             'assets/svg/menu_selected_tab.png',
      //             height: 50,
      //           ),

      //           label: 'More',
      //           // backgroundColor: Theme.of(context).primaryColor
      //         ),
      //       ]),
      // ),
    );
  }
}

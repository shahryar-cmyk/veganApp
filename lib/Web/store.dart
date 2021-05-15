import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StoreWeb extends StatefulWidget {
  @override
  _StoreWebState createState() => _StoreWebState();
}

class _StoreWebState extends State<StoreWeb> {
  int currentTab = 1;
  void splitScreen(int i) {
    switch (i) {
      case 0:
        FlutterWebviewPlugin().goBack();
        break;
      case 1:
        FlutterWebviewPlugin().reload();
        break;
      case 2:
        FlutterWebviewPlugin().goForward();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      //   body: Center(
      // child: Text('This is the text Widget'),
      url: "https://www.veganchoicefoods.com/",
      withZoom: true,
      appCacheEnabled: true,
      clearCache: true,
      withLocalStorage: true,
      hidden: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: currentTab,
          onTap: (i) {
            splitScreen(i);
            setState(() {
              currentTab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              title: Text('Back'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              title: Text('Refresh'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios),
              title: Text('Forward'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

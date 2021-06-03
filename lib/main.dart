import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:veganapp/Models/detail_latest_popular_screen.dart';
// import 'package:veganapp/Database/latest_dummy.dart';
import 'package:veganapp/bottom_navigation.dart';
import 'package:veganapp/network_provider/post.dart';
import 'package:veganapp/services/network_status_service.dart';
// import 'package:veganapp/widgets/home.dart';
// import 'Models/detail_meal_screen.dart';
// import 'package:veganapp/Database/popular_dummy.dart';
// import 'package:veganapp/widgets/drawer.dart';
// import 'package:veganapp/widgets/navigation_bar.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NetworkWordPress>(
          create: (_) => NetworkWordPress(),
        ),
        StreamProvider<NetworkStatus>(
          initialData: NetworkStatus.Offline,
          create: (context) =>
              NetworkStatusService().connectivityStreamController.stream,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        theme: ThemeData(canvasColor: Colors.white, fontFamily: 'Nunito'),
        debugShowCheckedModeBanner: false,
        title: 'Receipe App',
        home: BottomBarScreen(),
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   String greeting() {
//     var hour = DateTime.now().hour;
//     if (hour < 12) {
//       return ' Morning';
//     }
//     if (hour < 17) {
//       return ' Afternoon';
//     }
//     return ' Evening';
//   }

//   // void selectMealItem(BuildContext ctx) {
//   //   Navigator.of(ctx).push(
//   //     MaterialPageRoute(
//   //       builder: (_) {
//   //         return DetailPageScreen(
//   //           mealItem: DUMMY_LIST
//   //               .map(
//   //                 (meData) => ListViewReceipe(
//   //                     id: meData.id,
//   //                     title: meData.title,
//   //                     description: meData.description),
//   //               )
//   //               .toList(),
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomPadding: false,
//       bottomNavigationBar: NavigationBar(),
//       appBar: AppBar(
//           iconTheme: new IconThemeData(color: Colors.white),
//           title: Text(
//             'Vegan Choice Food',
//             style: TextStyle(fontFamily: 'Futur', color: Colors.white),
//           ),
//           backgroundColor: Colors.lightGreenAccent[400]),
//       drawer: Drawer(
//         child: MainDrawer(),
//       ),
//       body: ListView(
//         padding: EdgeInsets.only(top: 10),
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 ' Good',
//                 style: TextStyle(
//                     fontFamily: 'Futur',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5B8842),
//                     fontSize: 50.0),
//               ),
//               Text(greeting(),
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF5B8842),
//                       fontSize: 50.0)),
//               SizedBox(height: 10.0),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   '  Popular Food',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 17.0),
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width * 1,
//                     height: MediaQuery.of(context).size.width * 1,
//                     child: DetailPageScreen(
//                       mealItem: DUMMY_POPULAR,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Text(
//                 '    Latest Food',
//                 style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 17.0),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.97,
//                 height: MediaQuery.of(context).size.width * 0.6,
//                 child: DetailLatestPopularScreen(
//                   latestItem: DUMMY_LATEST,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

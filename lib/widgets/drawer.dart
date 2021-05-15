import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:veganapp/Web/store.dart';
import 'package:veganapp/main.dart';
import 'package:veganapp/widgets/about.dart';
// import 'package:wrap_text/Web/store.dart';
// import 'alkaline_diet.dart';
import 'home.dart';
import 'package:veganapp/Database/dummy_list.dart';
import 'package:veganapp/Class/list_view_receipe.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // void selectMeal(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return MainScreen();
  //       },
  //     ),
  //   );
  // }

  void selectHome(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Home(
              // todos: DUMMY_LIST
              //     .map(
              //       (meData) => ListViewReceipe(
              //           id: meData.id,
              //           title: meData.title,
              //           description: meData.description),
              //     )
              //     .toList(),
              );
        },
      ),
    );
  }

  void store(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return StoreWeb();
        },
      ),
    );
  }

  void about(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return About();
        },
      ),
    );
  }

  void share(BuildContext ctx) {
    Share.share('This is the Example App Check it out');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: ListView(
            children: <Widget>[
              // Text('Receipe App')
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: AssetImage("images/ReceipeLogo.png"),
                  fit: BoxFit.fill)),
        ),
        // ListTile(
        //   title: Text(
        //     'Receipes',
        //     style: TextStyle(
        //         fontFamily: 'Quicksand',
        //         color: Colors.black,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   leading: Icon(
        //     Icons.fastfood,
        //     size: 30,
        //     color: Colors.green,
        //   ),
        //   onTap: () => selectMeal(context),
        // ),
        ListTile(
          title: Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.home,
            size: 30,
            color: Colors.green,
          ),
          onTap: () => selectHome(context),
        ),
        // ListTile(
        //   title: Text(
        //     'Favourite',
        //     style: TextStyle(
        //         fontFamily: 'Quicksand',
        //         color: Colors.black,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   leading: Icon(
        //     Icons.favorite,
        //     size: 30,
        //     color: Colors.black,
        //   ),
        //   onTap: () => favoriteItem(context),
        // ),
        ListTile(
          title: Text(
            'Our Store',
            style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.green,
          ),
          onTap: () => store(context),
        ),
        ListTile(
          title: Text(
            'About',
            style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.info,
            size: 30,
            color: Colors.green,
          ),
          onTap: () => about(context),
        ),
        // Divider(),
        ListTile(
          title: Text(
            'Share',
            style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => share(context),
          leading: Icon(
            Icons.share,
            size: 30,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

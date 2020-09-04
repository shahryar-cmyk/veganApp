import 'package:flutter/material.dart';
import 'package:veganapp/Class/popular_item.dart';
// import 'package:wrap_text/Models/detail_latest_popular_screen.dart';
class Favourite extends StatelessWidget {
  final List<PopularItem> favoriteMeals;
  Favourite(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Scaffold(
            body: ListView(
              children: <Widget>[
                   Text(favoriteMeals[index].id),
              Text(favoriteMeals[index].title),
              Text(favoriteMeals[index].description)
              ],
            ),

          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
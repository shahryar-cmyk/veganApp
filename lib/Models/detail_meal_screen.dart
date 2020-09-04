import 'package:flutter/material.dart';
import 'package:veganapp/widgets/navigation_bar.dart';
import 'package:veganapp/Class/popular_item.dart';


class DetailPageScreen extends StatefulWidget {
  final List<PopularItem> mealItem;
  DetailPageScreen({Key key, @required this.mealItem,}) : super(key: key);

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.mealItem.length,
        itemBuilder: (ctx, index) {
          return Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMealScreenItem(
                        mealItems: widget.mealItem[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 210,
                  width: 200,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.white, Color(0xFFACBEA3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          blurRadius: 10.0,
                          spreadRadius: 0.5,
                          offset: Offset.fromDirection(20)),
                    ],
                  ),
                  child: ClipRRect(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 45, top: 20, left: 20, right: 20),
                      // margin: EdgeInsets.only(bottom: 40, top: 5),
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/plate1.png'),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 12,
                height: 40,
                child: Container(
                  child: Text(widget.mealItem[index].title),
                  width: 200,
                  margin: EdgeInsets.only(left: 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        });
  }
}

class DetailMealScreenItem extends StatefulWidget {
  final PopularItem mealItems;
  DetailMealScreenItem({Key key, @required this.mealItems}) : super(key: key);

  @override
  _DetailMealScreenItemState createState() => _DetailMealScreenItemState();
}

class _DetailMealScreenItemState extends State<DetailMealScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: ListView(children: <Widget>[
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(height: 300.0),
                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/green.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0))),
                  ),
                  Positioned(
                      top: 50.0,
                      left: (MediaQuery.of(context).size.width / 2) - 125,
                      child: Container(
                        height: 250.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/plate1.png'),
                                fit: BoxFit.cover)),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Text(widget.mealItems.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Container(
                    child: Text(
                      'About the Food',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Container(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Container(
                    child: Text(
                      'Ingredients',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Container(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Container(
                    child: Text(
                      'Decription',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 10, bottom: 30, right: 30),
                  child: Container(
                    child: Text(
                      widget.mealItems.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ]),
      ]),
      //  floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.favorite),
      //   onPressed: (){},
      // ),
    );
  }
}

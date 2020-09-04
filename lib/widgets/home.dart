import 'package:flutter/material.dart';
import 'package:veganapp/widgets/navigation_bar.dart';
import 'package:veganapp/Class/list_view_receipe.dart';

class Home extends StatefulWidget {
  final List<ListViewReceipe> todos;
  Home({Key key, @required this.todos}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Home',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreenAccent[400],
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 8),
            elevation: 10,
                      child: ListTile(
                        //index the child data to
                        title: Center(
                          child: Text(widget.todos[index].title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                todo: widget.todos[index],
                              ),
                            ),
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final ListViewReceipe todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(todo.title),
      //   backgroundColor: Colors.green,
      // ),
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
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/green.jpg'),
                            fit: BoxFit.fitWidth),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0))),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.width * 0.25,
                      left: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/plate1.png'),
                                fit: BoxFit.fill)),
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
              Text(
                widget.todo.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 10, right: 30, bottom: 30),
                  child: Container(
                    child: Text(
                      widget.todo.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              //  Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              //     child: Container(
              //       child: Text(
              //         'Ingredients',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              //  Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
              //     child: Container(
              //       child: Text(
              //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",textAlign: TextAlign.justify,
              //       ),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              //     child: Container(
              //       child: Text(
              //         'Decription',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              //  Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(

              //     padding: const EdgeInsets.only(left: 30, top: 10,bottom: 30,right: 30),
              //     child: Container(
              //       child: Text(
              //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",textAlign: TextAlign.justify,

              //       ),
              //     ),
              //   ),
              // ),
            ]),
      ]),
    );
  }
}

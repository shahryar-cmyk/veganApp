import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veganapp/Models/wordpress_post.dart';
import 'package:veganapp/network_provider/post.dart';
import 'package:veganapp/widgets/drawer.dart';
import 'package:html/dom.dart' as dom;
import 'package:veganapp/widgets/navigation_bar.dart';
import 'package:veganapp/Class/list_view_receipe.dart';

class Home extends StatefulWidget {
  // final List<ListViewReceipe> todos;
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    NetworkWordPress().getPosts();
    return Scaffold(
      // backgroundColor: Colors.green.shade900,

      drawer: Drawer(child: MainDrawer()),

      body: FutureBuilder(
        future: NetworkWordPress().getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: Container(
                  height: 60,
                  width: 80,
                  child: Lottie.asset('assets/Lottie/loadingLottie.json')),
            );
          if (snapshot.connectionState == ConnectionState.done) {
            final List<WordPressPost> wordPressPosts = snapshot.data;

            return ListView.builder(
              itemCount: wordPressPosts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  elevation: 5,
                  child: ListTile(
                    //index the child data to

                    title: Center(
                      child: Text(wordPressPosts[index].title.rendered,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.justify),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            todo: wordPressPosts[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return Center(
            child: Container(
                height: 60,
                width: 80,
                child: Lottie.asset('assets/Lottie/loadingLottie.json')),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: widget.todos.length,
      //   itemBuilder: (context, index) {
      //     return
      //     Card(
      //       margin: EdgeInsets.only(top: 8),
      //       elevation: 10,
      //                 child: ListTile(
      //                   //index the child data to
      //                   title: Center(
      //                     child: Text(widget.todos[index].title,
      //                         style: TextStyle(
      //                             fontSize: 20,
      //                             fontFamily: 'Quicksand',
      //                             fontWeight: FontWeight.bold),
      //                         textAlign: TextAlign.justify),
      //                   ),
      //                   onTap: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => DetailScreen(
      //                           todo: widget.todos[index],
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //     );

      //   },
      // ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final WordPressPost todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(height: 300.0),
                  Container(
                    height: 230.0,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/green.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0))),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 140),
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(60, 0, 0, 0),
                              blurRadius: 5.0,
                              offset: Offset(5.0, 5.0))
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.todo.featuredImageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 30, right: 30, bottom: 30),
                child: Text(
                  widget.todo.title.rendered,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 37,
                  right: 30,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Details :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    child: Html(
                      data: '''${widget.todo.content.rendered}''',
                      onLinkTap: (String url, RenderContext context,
                          Map<String, String> attributes, dom.Element element) {
                        _launchURL(url);
                        print('This is the Url $url');
                        //open URL in webview, or launch URL in browser, or any other logic here
                      },
                    ),

                    // child: Text(
                    //   widget.todo.content.rendered,
                    //   textAlign: TextAlign.justify,
                    //   style: TextStyle(fontSize: 20),
                    // ),
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

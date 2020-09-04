import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child:  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/About.jpg'),
                            fit: BoxFit.contain),
                        // borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(100.0),
                        //     bottomRight: Radius.circular(100.0))
                        ),
                  ),
      ),
    );
  }
}

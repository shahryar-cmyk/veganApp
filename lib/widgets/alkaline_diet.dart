import 'package:flutter/material.dart';
class AlkalineDiet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: ListView(
              children:<Widget>[ Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start
          ,children: <Widget>[
        
          
          Stack(
            children: <Widget>[
              Container(height: 300.0),
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/green.jpg'), fit: BoxFit.cover),
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
              // Align(
              //   alignment: Alignment.topRight,
              //   child: IconButton(
              //     icon: Icon(Icons.more_horiz),
              //     color: Colors.white,
              //     onPressed: () {return Text('data');},
              //   ),
              // )
            ],
          ),
          Text(
            'What is the Alkaline Plant  based Diet?',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,
          ),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          //     child: Container(
          //       child: Text(
          //         'About the Food',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10,right: 30,bottom: 30),
              child: Container(
                child: Text(
                  "An alkaline plant-centered diet and the use of alkaline herbal medicine naturally support the healthy expression of the african genome in all people, and reverses chronic disease. Pharmaceutical medicine is built on the powder of medicinal herbs because around 50% of its drugs are derived from herbs. The issue is industry has strategically conditioned people to forget about the healing power of natural alkaline herbs The alkaline plant based diet optimally supports the alkaline pH level in the blood, which is the equilibrium point for the health of all the organs in the body. Consuming acidifying meat, dairy and processed foods causes the body to rely on buffering system to keep the blood’s pH around 7.4. ",textAlign: TextAlign.justify,style: TextStyle(fontSize: 20),
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
              ]
      ),
    );
  }
}

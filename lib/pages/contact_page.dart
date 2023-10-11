import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/text_style.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/drawer.widget.dart';

String _url = 'https://flutter.dev';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Centre d'interets",
                style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.indigo,
                    shadows: [
                      Shadow(
                          offset:Offset(5,5),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10
                      )
                    ]
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color:
                          Colors.indigo, //Color.fromARGB(255, 21, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 90,
                                        child: Image.asset("assets/ingenieur.png")),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Informatique",
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.indigo, //.fromARGB(255,21,21,21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 90,
                                        child: Image.asset(
                                            "assets/joueurdefootball.png")),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Football",
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.indigo, //Color.fromARGB(255,21,21,21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 90,
                                        child: Image.asset("assets/swim.png")),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Swim",
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),

                    ],
                  ),
                )

              /*  Text( "ddddddd",style: TextStyle(
                  color: Colors.white,fontSize: 28.0,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,




                  ,),
            )*/
            )
          ],
        ),
      ),
    );
  }
}

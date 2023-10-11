import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/text_style.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/drawer.widget.dart';

class scanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "CV en PDF  ",
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
                  textAlign: TextAlign.start
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 150),
              child: Center(
                child: SizedBox(
                    height:280,
                    width: 300,

                    child: Image.asset("assets/pdf.png")),
              ),
            )

          ],
        ),
      ),
    );
  }
}

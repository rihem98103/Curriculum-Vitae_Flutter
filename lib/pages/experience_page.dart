

import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';
import '../widgets/drawer.widget.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //drawer: CollapsingNavigationDrawer(),
    drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Projet",
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
                ),
              ),
              _itemWidget("28 Juillet, 2023", description6),

              _itemWidget("19 Mai, 2023", description5),

              _itemWidget("22 Mai, 2023", description4),

              _itemWidget("9 Janvier, 2023", description3),

              _itemWidget("14 Décembre, 2022", description2),

              _itemWidget("20 Décembre, 2021", description1),
            ],
          ),

        ),

      ),
    );
  }

  Widget _itemWidget(title, description) {
    return Container(
     // width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(

            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 10),
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              Text(
                title,
                style: subHeaderTextStyle,
              )
            ],
          ),
          Container(
            height:100,
            margin: EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 2, color: Colors.blueGrey))),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: cardBGColor),
              child: Text(description),
            ),
          )
        ],
      ),
    );
  }
}
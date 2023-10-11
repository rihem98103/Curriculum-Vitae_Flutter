import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/text_style.dart';
import '../widgets/drawer.widget.dart';

String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class TeamPage extends StatefulWidget {
  @override
  State<TeamPage> createState() => _TeamPage();
}

class _TeamPage extends State<TeamPage> {
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
                    padding: const EdgeInsets.all(19.0),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Compétances",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.indigo,
                            shadows: [
                              Shadow(
                                  offset: Offset(5, 5),
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10)
                            ]),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        "Language",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                          shadows: [
                            Shadow(
                              offset: Offset(5, 5),
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            _buildFrameworkItem("JAVA"),
                            _buildFrameworkItem("C#"),
                            _buildFrameworkItem("PHP"),
                            _buildFrameworkItem("IA"),
                            _buildFrameworkItem("C"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Framework",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                          shadows: [
                            Shadow(
                              offset: Offset(5, 5),
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        /*decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),*/
                        //child: Padding(
                        // padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              _buildFrameworkItem("Symfony"),
                              _buildFrameworkItem("Laravel"),
                              _buildFrameworkItem("Asp.net"),
                              _buildFrameworkItem("Sélénium"),
                            ],
                          ),
                        //),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Conception",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                          shadows: [
                            Shadow(
                              offset: Offset(5, 5),
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(

                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              _buildFrameworkItem("Merise"),
                              _buildFrameworkItem("Uml"),
                            ],

                        ),
                      ),
                    ],
                  )
                ]))));

    //  _itemWidget("Framework : "," \nSymfony, Laravel, Asp.net, Sélénium"),
    //  _itemWidget("Conception : ","\nMerise, Uml"),
    //   _itemWidget("SGBD : "," \nSql Server, Wampserver, Laragon\n\n"),

    /////mode nuit et mode jour
    /*  Text("Mode",style:TextStyle(fontSize: 22),),
                     ListTile(
                       title: Text("Jour"),
                       leading: Radio<String>(
                         value:"Jour",
                         groupValue: "mode",
                         onChanged: (value){
                           setState((){
                             mode=value!;
                           });
                         },
                       ),
                     ),
                      ListTile(
                        title: Text("Nuit"),
                        leading: Radio<String>(
                          value:"Nuit",
                          groupValue: "mode",
                          onChanged: (value){
                            setState((){
                              mode=value!;
                            });
                          },
                        ),
                      ),
                    Container(
                       padding: EdgeInsets.all(10),
                       child:ElevatedButton(
                         style:ElevatedButton.styleFrom(
                           minimumSize: const Size.fromHeight(50)
                         ),
                           onPressed: (){_onSaveMode();}, child: Text("Enregistrer"))
                     ),*/
  }

  Widget _itemWidget(title, value) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: subHeaderTextStyle,
            ),
            Center(
                child: Text(
              value,
              style: bodyTextStyle,
            )),
          ],
        ),
      ),
    );
  }

  Widget _itemWidgete(title, value) {

    return Container(
      margin: EdgeInsets.only(top: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Container(
                  child: Text(
                title,
                style: subHeaderTextStyle,
              )),
              Text(
                value,
                style: bodyTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildFrameworkItem(String s) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
        borderRadius: BorderRadius.circular(8.0),),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          s,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
/*void  _onSaveMode() async {
    await  ref.set({"mode":mode});
    print("mode applique $mode");
    Navigator.pop(context);


  }*/
}

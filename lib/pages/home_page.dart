import 'package:cvversion2/commons/collapsing_navigation_drawer_widget.dart';
import 'package:cvversion2/custom_navigation_drawer.dart';
import 'package:cvversion2/pages/contact_page.dart';
import 'package:cvversion2/pages/experience_page.dart';
import 'package:cvversion2/pages/parametre_page.dart';
import 'package:cvversion2/pages/portfolio_page.dart';
import 'package:cvversion2/pages/team_page.dart';
import 'package:cvversion2/utils/common_string.dart';
import 'package:cvversion2/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

import '../utils/AppColors.dart';
import 'package:animated_background/animated_background.dart';

import '../utils/theme.service.dart';
import '../widgets/drawer.widget.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key, required PageController controller}) : super(key: key);
  final PageController controller = PageController(initialPage: 1, keepPage: true);


  @override
  _HomePageState createState() => _HomePageState();
}

/*final List<Widget> pages = GlobalParams.menus.map((menu) {
  return Container(
    color: Colors.grey[200],
    child: Center(
      child: Text(menu['title']),
    ),
  );
}).toList();*/




class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final PageController controller;
  final List<Widget> pages =  [
    ContactPage(),
    PortfolioPage(),
    ExperiencePage(),
    ParameterPage(),
  ];
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  late final AnimationController animationController;
  late Animation<double> widthAnimation;
 // late final PageController controller;
  //HomePage({this.controller});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    const kPrimaryColor = Color(0xFF1E3857);
    var width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    const double kDefaultPadding = 20.0;

    return Scaffold(
        //drawer: CollapsingNavigationDrawer(),
        // appBar: _appBar(),
        drawer: MyDrawer(),
        body: 
          //controller: controller,
         // children: <Widget>[

        PageView(
          controller: widget.controller,
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: GlobalParams.menus.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(GlobalParams.menus[index]['title']),
              ),
            );
          },
        ),

             Column(
              children: [
                SizedBox(
                  height: 390,
                  child: Stack(
                      // fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          height: size.height * 0.3 - 27,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36),
                                bottomRight: Radius.circular(36)),
                          ),
                          child: Center(
                              child: SizedBox(
                            height: 240,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/profil.png"),
                              radius: 80,
                            ),
                          )),
                        ),

                        /* Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "",
                    style: headerTextStyle,
                  ),
                ),*/

                        Center(
                          child: SizedBox(
                            height: 55,
                            width: 300,
                            child: Container(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 50, right: 10, top: 10),
                                child: Text("Rihem CHERIF", style: RIHE),
                              ),

                              //  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                              // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                              //    height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: kPrimaryColor.withOpacity(0.5)),
                                ],
                              ),
                              /* child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text("Rihem CHERIF", style: RIHE),
                      ),*/
                            ),
                          ),
                        ),

//debut
                        Align(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            Container(
                              child: Text("", style: bodyTextStyle),
                              margin: EdgeInsets.only(top: 50, bottom: 10),
                            ),

                          /*  Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                child: TabBarView(
                                  controller: tabController,
                                  children: <Widget>[
                                    HomePage(controller: controller,),
                                    ExperiencePage(),
                                    PortfolioPage(),
                                    TeamPage(),
                                    ContactPage()
                                  ],
                                ),
                              ),
                            )*/
                          ]),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 50, top: 0, bottom: 20),
                  child: Column(
                    children: [

                      InkWell(
                        child:Text("Cliquer ici"),onTap: () {
                        showModalBottomSheet(context: context, builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 100,
                                //color: cardBGColor,
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10.0, top: 0),
                                  child: Text(name, style: headerTextStyle),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 40),
                                  child:
                                  Text(description, style: bodyTextStylee),
                                ),
                              ),
                            ],
                          );

                        });
                      },),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "Langues",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(5, 5),
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 10)
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 50, top: 0, bottom: 10),
                        child: _itemWidgett("Arabe : Maternelle", ""),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 50, top: 0, bottom: 10),
                        child: _itemWidgett("Francais : Moyen", ""),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 50, top: 0, bottom: 10),
                        child: _itemWidgett("Anglais : Moyen", ""),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "Associative",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(5, 5),
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 10)
                                  ]),
                            ),
                          ),

                        ],

                      ),

                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 50, top: 0, bottom: 0),
                        child: _itemWidgett("Membre active Dans Club PYTON : IIT & FSEGS",""),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 30, top: 0, bottom:0),
                        child: _itemWidgett("Travail En Equipe",""),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 30, top: 0, bottom: 0),
                        child: _itemWidgett("Gestion De Temps",""),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],

        )


    );
  }

  Widget _itemWidgett(title, value) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 2),
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
              style: bodyStyle,
            )),
          ],
        ),
      ),
    );

  }

  /*  Container(

     // SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 0, bottom: 0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("", style: headerTextStyle,),

              ),
              /*  Container(
                child: Text( ,style: bodyTextStyle),
                margin: EdgeInsets.only(top: 20, bottom: 10),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profil.png"),
                      radius: 80,
                    )
                ),

              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text("Rihem CHERIF", style: RIHE),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      _itemWidget("Click ici\n",width)],),

                      Row(

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text("Langues",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue,
                             /* shadows: [
                                Shadow(
                                    offset:Offset(5,5),
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10
                                )
                              ]*/
                            ),),


                          ),

                          )  ],
                      ),
                      SizedBox(height: 3,),
                      _itemWidgett("Arabe : Maternelle",""),
                      _itemWidgett("Francais : Moyen",""),
                       _itemWidgett("Anglais : Moyen",""),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text("Associative",style: headerTextStyle,),

                          ),
                        ],
                      ),

                  SizedBox(height: 3,),
                  _itemWidgett("Membre active Dans Club PYTON : ","IIT & FSEGS\n"),
                  _itemWidgett("Travail En Equipe",""),
                  _itemWidgett("Gestion De Temps",""),



                ],
              )


            ],
          ),
        ),
            )

          ], ),



    );

  }*/

  Widget _itemWidget(title) {
    return Expanded(
      flex: 1,
      // width: width,
      child: InkWell(
          onTap: () {
            scaffoldkey.currentState!.showBottomSheet((context) {
              return Container(
                // color: backgroundLight,
                //width: width,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      //   alignment: Alignment.center,
                      /* child: AppImageWidget(
                      imageUrl: image,
                      fit: BoxFit.fitWidth,
                    ),*/
                      color: cardBGColor,
                    ),
                    // Text("fffff"),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0),
                        child: Text(name, style: headerTextStyle),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 50),
                        child: Text(description, style: bodyTextStylee),
                      ),
                    ),
                  ],
                ),
              );
            });
          },
          child: Container(
            margin: EdgeInsets.all(2),
            //  height: 100,
            width: 500,
            // color: Colors.lightGreen,
            alignment: Alignment.center,
            child: Text(title),
          )),
    );
  }
}

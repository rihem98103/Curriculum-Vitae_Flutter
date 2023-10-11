import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cvversion2/firebase_options.dart';
import 'package:cvversion2/pages/contact_page.dart';
import 'package:cvversion2/pages/experience_page.dart';
import 'package:cvversion2/pages/home_page.dart';
import 'package:cvversion2/pages/parametre_page.dart';
import 'package:cvversion2/pages/portfolio_page.dart';
import 'package:cvversion2/pages/scan_page.dart';
import 'package:cvversion2/pages/team_page.dart';
import 'package:cvversion2/utils/AppColors.dart';

import 'package:cvversion2/utils/AppIcons.dart';
import 'package:cvversion2/utils/text_style.dart';
import 'package:cvversion2/utils/theme.dart';
import 'package:cvversion2/utils/theme.service.dart';
import 'package:cvversion2/widgets/navigation_menu_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_menu_widget.dart';
import 'commons/collapsing_list_tile_widget.dart';
import 'commons/collapsing_navigation_drawer_widget.dart';


import 'package:animated_background/animated_background.dart';


String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();
Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
 // theme=(await _onGetMode()=="Jour")? ThemeData.light():ThemeData.dark();
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(theme: initTheme));
}
final PageController controller = PageController();
//final ThemeData theme;
class MyApp extends StatelessWidget {
  MyApp({required this.theme});
   ThemeData theme= ThemeData.light();
  final routes ={
    '/home': (context) => HomePage(controller:controller),
    '/experience': (context) =>ExperiencePage(),
    '/portfolio':(context)=> PortfolioPage(),
    '/team': (context) => TeamPage(),
    '/contact': (context) => ContactPage(),
    '/scan': (context) => scanPage(),




  };

  @override
  Widget build(BuildContext context) {
    
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {

    return MaterialApp(


      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/

      routes: routes,
      theme: theme,
      home: HomePage(controller: controller,),
           //MyIndexPage(),//,//kenet my home page
    );
      },
    );
  }
}
final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();


Future<String> _onGetMode() async{
  final snapshot= await ref.child("mode").get();
  if(snapshot.exists)

    mode = snapshot.value.toString();

  else

    mode="jour";
  print(mode);
  return (mode);
}
class MyIndexPage extends StatefulWidget {
  @override
  _MyIndexPageState createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> with TickerProviderStateMixin {
   TabController? tabController;
   int selectedMenuIndex = 1;
   ParticleOptions particles = const ParticleOptions(
     baseColor: Colors.grey,
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

   String mode ="Jour";
  /*@override
  void initSate() {
    super.initState();
    tabController = new TabController(length: 5, vsync: this);
    tabController!.addListener(() {
      setState(() {
        selectedMenuIndex = tabController!.index;
      });
    });
  }*/

   double maxWidth = 210;
   double minWidth = 70;
   bool isCollapsed = false;
   late AnimationController _animationController;
   late Animation<double> widthAnimation;


   @override
   void initState() {
     //super.initState();
     _animationController = AnimationController(
         vsync: this, duration: Duration(milliseconds: 300));
     widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
         .animate(_animationController);
   }

   /*@override
   Widget build(BuildContext context) {
     return AnimatedBuilder(
       animation: _animationController,
       builder: (context, widget) => getWidget(context, widget),
     );
   }
   Widget getWidget(context, widget) {
     return Material(
       elevation: 80.0,
       child: Container(
         width: widthAnimation.value,
         color: drawerBackgroundColor,
         child: Column(
           children: <Widget>[
             CollapsingListTile(title: 'Techie',
               icon: Icons.person,
               animationController: _animationController, ),
             Divider(color: Colors.grey, height: 40.0,),


            /* Expanded(
               child: ListView.separated(
                 separatorBuilder: (context, counter) {
                   return Divider(height: 12.0);
                 },
                 // (children:getItemList(),


               ),
             ),*/


             InkWell(
               onTap: () {
                 setState(() {
                   isCollapsed = !isCollapsed;
                   isCollapsed
                       ? _animationController.forward()
                       : _animationController.reverse();
                 });
               },
               child: AnimatedIcon(
                 icon: AnimatedIcons.close_menu,
                 progress: _animationController,
                 color: selectedColor,
                 size: 50.0,
               ),
             ),
             SizedBox(
               height: 50.0,
             ),
           ],
         ),
       ),
     );
   }



*/




  @override
  Widget build(BuildContext context) {
    double iconsize = 25.0;
    return DefaultTabController(
      length: 5,
      child:Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.white,//indigo
       //   drawer: CollapsingNavigationDrawer(),
        body:
        //Container(
            //child:
     // Container(
    //child:
          AnimatedBackground(
    vsync: this,
    behaviour: RandomParticleBehaviour(options: particles),
    child:
        Container(
            margin: EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[



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
                           onPressed: _onSaveMode(), child: Text("Enregistrer"))
                     )*/


                     /* Container(
                        width: 45,
                        height: 45,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        //child: Image.asset("assets/avtar1.png"),
                      ),*/
                  /*    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: NavigationMenu(
                          context,Icons.home.toString(),
                          height: iconsize,
                          width: iconsize,
                          isSelected: selectedMenuIndex == 1,
                          onClick: () {
                            tabController!.animateTo(0);
                          },
                        ),
                      ),*/
                  /*    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/team');
                        },
                        child: NavigationMenu(
                          context,Icons.search.toString(),
                          height: iconsize,
                          width: iconsize,
                          isSelected: selectedMenuIndex == 1,
                          onClick: () {
                            tabController!.animateTo(1);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/portfelio');
                        },
                        child: NavigationMenu(
                          context,Icons.contacts.toString(),
                          height: iconsize,
                          width: iconsize,
                          isSelected: selectedMenuIndex == 2,
                          onClick: () {
                            tabController!.animateTo(2);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/experience');
                        },
                        child: NavigationMenu(
                          context,Icons.add.toString(),
                          height: iconsize,
                          width: iconsize,
                          isSelected: selectedMenuIndex == 3,
                          onClick: () {
                            tabController!.animateTo(3);
                          },
                        ),
                      ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/contact');
                },
                child: NavigationMenu(
                  context,Icons.contacts.toString(),
                  height: iconsize,
                  width: iconsize,
                  isSelected: selectedMenuIndex == 4,
                  onClick: () {
                    tabController!.animateTo(4);
                  },
                ),
              ),*/
              ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: TabBarView(
                       controller: tabController,
                      children: <Widget>[
                        //HomePage(),
                        ExperiencePage(),
                         PortfolioPage(),
                        TeamPage(),
                        ContactPage()
                      ],
                    ),
                  ),
                )
              ],
    )
        )
    )
        )
     //   )
      //)
    );
  }

 void  _onSaveMode() async {
  //await  ref.set({"mode":mode});
  print("mode applique $mode");
  Navigator.pop(context);


 }





}
//recuper le mode en chaine caractére et le reoutner dans un future
/**/

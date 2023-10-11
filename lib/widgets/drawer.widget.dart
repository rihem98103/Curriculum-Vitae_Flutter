import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cvversion2/widgets/navigation_model.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../commons/collapsing_list_tile_widget.dart';
import '../utils/text_style.dart';
import '../utils/theme.dart';


import '../utils/theme.service.dart';
import '../widgets/navigation_menu_widget.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({Key?key}) : super (key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();

}class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin
{
  late SharedPreferences prefs;
  late AnimationController _animationController;
 // late Animation<double> _animation;
  //double maxWidth = 150;
  //double minWidth = 50;
  bool isCollapsed = false;
  bool iconText = true;
  late Animation<double> widthAnimation;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    /*widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);*/

    widthAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  /*void _toggleAnimation(int index) {
    setState(() {
      isCollapsed = !isCollapsed;
      isCollapsed ? _animationController.forward() : _animationController.reverse();
      maxWidth = isCollapsed ? minWidth : maxWidth;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    late SharedPreferences prefs;

    return Drawer(
      width: 250,

      child: Container(

        color: drawerBackgroundColor,
        child: Column(
          children: [

            CollapsingListTile(title: 'Portfelio',
              icon: Icons.person,
              animationController: _animationController,

            ),
            Divider(color: Colors.grey, height: 40.0,),
           /* DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blueGrey],
                ),
              ),
              child: FadeTransition(
                opacity: widthAnimation,
                child: Center(
                  child: Text(
                    'My App',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),*/
            Expanded(
              child: ListView(
                children: [
                  ...(GlobalParams.menus as List).map(
                        (item) {
                          bool selected = false;
                          return    iconText ?
                       ListTile(
                        title: Text('${item['title']}',
                          style: selected ? listTitleSelectedTextStyle : listTitleDefaultTextStyle,),

                        leading: item['icon'],
                        trailing: Icon(Icons.arrow_right, color: Colors.white30),
                        onTap: () async {
                          _animationController.reverse().then((value) {

                            Navigator.pop(context);
                            Navigator.pushNamed(context, "${item['route']}");
                          },


                          );
                        },
                        selected: true, // Si l'élément est sélectionné, vous pouvez définir cette valeur sur 'true'
                        selectedTileColor: selectedColor, // couleur de l'élément sélectionné
                        tileColor: drawerBackgroundColor, // couleur de l'élément
                         //selectedTextStyle: listTitleSelectedTextStyle, // style de l'élément sélectionné
                         // spécifiez la couleur de la police de caractères pour l'élément sélectionné et non sélectionné


                       ):  SizedBox(
                            height: 50,
                         child: ListTile(
                            leading: item['icon'],
                            trailing: Icon(Icons.arrow_right, color: Colors.white30),
                            onTap: () async {
                            _animationController.reverse().then((value) {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, "${item['route']}");
                            },


                            );
                            },
                            selected: true, // Si l'élément est sélectionné, vous pouvez définir cette valeur sur 'true'
                            selectedTileColor: selectedColor, // couleur de l'élément sélectionné
                            tileColor: drawerBackgroundColor, // couleur de l'élément
                            // selectedTextStyle: listTitleSelectedTextStyle, // style de l'élément sélectionné
                            ),
                       )
                          ;
                    },
                  ),
                ],
              ),
            ),




            ThemeSwitcher(
                builder: (context)
                {
                  bool isDarkMode =
                      ThemeModelInheritedNotifier
                          .of(context)
                          .theme
                          .brightness ==
                          Brightness.light;
                  String themeName = isDarkMode ? 'dark' : 'light';
                  return DayNightSwitcherIcon(
                    isDarkModeEnabled: isDarkMode,
                    onStateChanged: (bool darkMode) async {
                      var service = await ThemeService.instance
                        ..save(darkMode ? 'light' : 'dark');
                      var theme = service.getByName(themeName);
                      ThemeSwitcher.of(context)
                          .changeTheme(theme: theme, isReversed: darkMode);
                    },
                  );
                }
            ),





    InkWell(
              onTap: () {
                setState(() {
                  iconText=!iconText;
                  //avec
                  //_toggleAnimation(index);
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
}
         /*   ListTile(
            title: Text('Acceuil', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('portfolio', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.sunny_snowing, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/portfolio');
            },
          ),
          ListTile(
            title: Text('experience', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/experience');
            },
          ),
          ListTile(
            title: Text('team', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.location_city, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/team');
            },
          ),
          ListTile(
            title: Text('Contact', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.contact_page, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),*/


          //const Divider(height: 4, color: Colors.blue)),

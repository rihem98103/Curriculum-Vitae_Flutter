import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/text_style.dart';
import '../utils/theme.service.dart';
import '../widgets/drawer.widget.dart';

String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class ParameterPage extends StatefulWidget {

  @override
  State<ParameterPage> createState() => _ParameterPage();

}
class _ParameterPage extends State<ParameterPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //drawer: CollapsingNavigationDrawer(),
      // appBar: _appBar(),
        drawer: MyDrawer(),
        body:Center(
    child:
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
    )
        )
    );














              /*return Scaffold(
      //drawer: CollapsingNavigationDrawer(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),*/

            /*  /////mode nuit et mode jour
              Text("Mode",style:TextStyle(fontSize: 22),),
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
              ),


            ],
          ),
        ),
      ),
    );*/
  }
  Widget _itemWidget(title,value){
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: subHeaderTextStyle,),
          Center(child: Text(value,style: bodyTextStyle,)),
        ],
      ),
    );
  }
  void  _onSaveMode() async {
    await  ref.set({"mode":mode});
    print("mode applique $mode");
    Navigator.pop(context);


  }


}
import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_model.dart';

/*
class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
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


            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
               // (children:getItemList(),

                 itemBuilder: (context, counter) {
                  var item= NavigationModel.navigationItems[counter];
                  //print('hh');
                  return CollapsingListTile(

                    //////hethy eli tete7akem fil selection
                    isSelected: counter ==currentSelectedIndex ,
                    onTap: () {
                      setState(() {print('bb');
                      currentSelectedIndex = counter;
                      });

                      //parcourir les differentes elements du menu

                      (NavigationModel.navigationItems as List)
                          .map((item) {
                        Navigator.pushNamed(
                          context,
                          item['route'],
                          arguments: currentSelectedIndex,
                        );
                      }).toList();
  Navigator.pop(context);
                    },
                    title: item.title,
                    icon: item.icon, // Ajout de Icon()
                    animationController: _animationController ,
                  );

                },
                itemCount: NavigationModel.navigationItems.length,

              ),
            ),


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

  List<Widget> getItemList() {
    List<Widget> itemList = [];
    for (var item in NavigationModel.navigationItems) {
      int counter = NavigationModel.navigationItems.length;
      itemList.add(
        CollapsingListTile(
          isSelected: currentSelectedIndex == counter,
          //////hethy eli tete7akem fil selection
          onTap: () {
            setState(() {
              currentSelectedIndex = counter;
            });
          },
          title: item.title,
          icon: item.icon,
          animationController: _animationController,
        ),
      );
    }
    return itemList;
  }
}
*/
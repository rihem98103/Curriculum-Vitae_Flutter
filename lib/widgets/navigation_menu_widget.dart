import 'package:cvversion2/widgets/svg_loader.dart';
import 'package:flutter/material.dart';

import '../utils/AppColors.dart';


Widget NavigationMenu(BuildContext context,icon, {isSelected = false, height, width,onClick}) {
  return InkWell(
      onTap: onClick,
      child:Container(

      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          svgLoader(icon, height: height, width: width),
          Container(
            margin: EdgeInsets.all(8),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: isSelected ? navigationSelectionColor : Colors.transparent,
            ),
          )

     /*    ListTile(
            title: Text('Acceuil', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Meteo', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.sunny_snowing, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/meteo');
            },
          ),
          ListTile(
            title: Text('Gallerie', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/gallerie');
            },
          ),
          ListTile(
            title: Text('Pays', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.location_city, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pays');
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
          ),
          ListTile(
            title: Text('Parametres', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.settings, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/parameteres');
            },
          ),
          ListTile(
            title: Text('Deconnexion', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.logout, color: Colors.blue),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/parameteres');
            },
          ),*/
        ],
      ),
      ),
  );
}
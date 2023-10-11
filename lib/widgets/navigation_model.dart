import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*class NavigationModel {
  String title;
  IconData icon;
  String route;

  NavigationModel({required this.title, required this.icon, required this.route});*/

class GlobalParams{
static List<Map<String,dynamic>> menus = [
  {"title":"Home","icon":Icon(Icons.home),"route":"/home"},
  {"title":"Contact","icon":Icon(Icons.contacts),"route":"/contact"},
  {"title":"Experience","icon":Icon(Icons.work),"route":"/experience"},
  {"title":"Portfolio","icon":Icon(Icons.person),"route":"/portfolio"},
  {"title":"Competence","icon":Icon(Icons.developer_mode,),"route":"/team"},
  {"title":"Scan","icon":Icon(Icons.qr_code,),"route":"/scan"},
];

 /* static List<NavigationModel> get navigationItems {
    return [
      NavigationModel(title: "home", icon: Icons.insert_chart, route: "/home"),
      NavigationModel(title: "contact", icon: Icons.error, route: "/contact"),
      NavigationModel(
          title: "expérience", icon: Icons.search, route: "/experience"),
      NavigationModel(
          title: "portfilio", icon: Icons.notifications, route: "/portfolio"),
      NavigationModel(title: "team", icon: Icons.settings, route: "/team"),
    ];
  }*/
}


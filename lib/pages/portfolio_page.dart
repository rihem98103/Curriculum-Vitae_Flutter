

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/data.dart';
import '../widgets/drawer.widget.dart';

//void main(){runApp();}
class PortfolioPage extends StatelessWidget {

  void _launchURL(String _url) async {
    if (!await launch(
        _url,
    forceWebView: true,
    enableJavaScript: true,)) throw 'Could not launch $_url';
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      //drawer: CollapsingNavigationDrawer(),
    drawer: MyDrawer(),
      body: ListView(
        children: data.map((item) {
          return Card(
            child: SizedBox(height: 90,
              child: ListTile(
                onTap: () => _launchURL(item['url']),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  child: FaIcon(
                    item['icon'],
                    color: item['color'],
                    size: 25,
                  ),
                ),
                title: Text(
                  item['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
               // subtitle: Text(item[' he']),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => _launchURL(item['url']),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
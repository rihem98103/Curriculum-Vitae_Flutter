import 'package:cvversion2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import'package:get_storage/get_storage.dart';
/*class ThemeService {
  final _box= GetStorage();
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode)=> _box.write(_key,isDarkMode);

  bool _loadThemeFromBox()=>_box.read(_key)??false;
  ThemeMode get theme => _loadThemeFromBox()?ThemeMode.dark:ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox()?ThemeMode.light:ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }


}*/
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {

  ThemeService._();

  static late SharedPreferences prefs;
  static ThemeService? _instance;

  static Future<ThemeService> get instance async {
    if (_instance == null){
      prefs = await SharedPreferences.getInstance();
      _instance = ThemeService._();
    }
    return _instance!;
  }

  final allThemes = <String, ThemeData>{
    'dark': darkTheme,
    'light': lightTheme,
  };

  get initial {
    String? themeName = prefs.getString('theme');
    if (themeName == null){
      final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return allThemes[themeName];
  }

  save(String newThemeName){
    prefs.setString('theme', newThemeName);
  }

  ThemeData getByName(String name){
    return allThemes[name]!;
  }

}











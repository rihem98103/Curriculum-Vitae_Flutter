import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const Color bluishClr = Colors.white;
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Color(0xFF424242);
/*class Themes{
  static final light= ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr ,
      brightness: Brightness.light

  );
  static final dark= ThemeData(
      backgroundColor:darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark
  );


}*/
ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[700],
    )
);

ThemeData darkTheme = ThemeData.dark();
import 'package:flutter/material.dart';



ThemeData appTheme = ThemeData(
  canvasColor: Colors.white70.withOpacity(0.9),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold,color: Colors.black),//shop title
    headline2: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic,color: Colors.grey),//shop subtitle
    headline3: TextStyle(fontSize: 19.0, fontStyle: FontStyle.normal,color: Colors.white),// product title
    headline4: TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal,color: Colors.white,fontWeight: FontWeight.bold),//product subtitle
  ),

  scaffoldBackgroundColor: Color(0xff331759),
  primaryColor: Color(0xff331759) ,
  // primaryColorDark: Color(0xff45177e),
  iconTheme: IconThemeData(color: Colors.amberAccent,size: 20),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(),
  ),
);

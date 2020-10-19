import 'package:flutter/material.dart';

final appTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    accentColor: Colors.greenAccent);

final TextTheme appTextTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: 'Corben',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.black,
  ),
  headline2: TextStyle(
    fontFamily: 'Corben',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Corben',
    //fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  ),
);

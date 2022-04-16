import 'package:flutter/material.dart';

class UiTheme {
  UiTheme._();
  static final appTheme = ThemeData(
    /* Colors */
    primaryColor: Colors.teal,
    primarySwatch: Colors.blueGrey,
    primaryColorBrightness: Brightness.light,
    primaryColorDark: Colors.black87,
    primaryColorLight: Colors.white70,
    secondaryHeaderColor: Colors.tealAccent[400],
    shadowColor: Colors.tealAccent,
    scaffoldBackgroundColor: Colors.teal[200],
    bottomAppBarColor: Colors.tealAccent[100],
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.green),
      headline4: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
      subtitle2: TextStyle(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[100],
      foregroundColor: Colors.teal[900],
      shadowColor: Colors.teal[900],
      centerTitle: true,
    ),
    colorScheme:
        ColorScheme.light(primary: Colors.teal), //PaletaCores.corDestaque,
    /* Colors */
    fontFamily: 'Quicksand',
    canvasColor: Color.fromRGBO(255, 255, 255, 1),
    backgroundColor: Colors.teal[50],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
      hintStyle: TextStyle(color: Colors.blueAccent),
    ),
  );
}

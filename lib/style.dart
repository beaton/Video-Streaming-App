import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.grey),
  iconTheme: IconThemeData(color: Colors.grey),
  dividerColor: Colors.black12,
  tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.all(10),
      labelStyle: TextStyle(fontSize: 20.0),
      unselectedLabelStyle: TextStyle(fontSize: 20.0)),
  appBarTheme: AppBarTheme(
    color: Colors.grey[850],
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(Colors.grey),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[600],
    showUnselectedLabels: false,
    showSelectedLabels: true,
    elevation: 10,
  ),
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  iconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 12.0),
      unselectedLabelStyle: TextStyle(fontSize: 12.0)),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.grey[800]),
    trackColor: MaterialStateProperty.all(Colors.grey),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey[600],
    showUnselectedLabels: false,
    showSelectedLabels: true,
    elevation: 10,
  ),
);

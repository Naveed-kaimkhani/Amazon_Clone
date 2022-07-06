//File that will contain all the global variables used through out the project
import 'package:flutter/material.dart';

class globalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color(0xFF4e5ae8),
      Color(0XFF6A62B7)
      // Color.fromARGB(a, r, g, b)
      //static const secondaryColor =Color(0xFF4e5ae8);
      //Color.fromARGB(255, 29, 201, 192),
      //  Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  final AppBarHeight = 80;
  static const List<Color> backgroundGradient = [
    Color(0xFF4e5ae8),
    Color(0XFF6A62B7)
  ];

  static const secondaryColor = Color(0xFF4e5ae8);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const kPrimaryColor = Color.fromARGB(255, 60, 44, 210);
  static const kBackgroundColor = Color(0XFFE5E5E5);
  static const deepPurple = Colors.deepPurple;
}

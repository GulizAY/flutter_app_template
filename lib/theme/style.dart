import 'package:flutter/material.dart';

// ThemeData appTheme() {
//   return ThemeData(
//     primaryColor: Colors.white,
//     accentColor: Colors.orange,
//     hintColor: Colors.white,
//     dividerColor: Colors.white,
//     buttonColor: Colors.white,
//     scaffoldBackgroundColor: Colors.black,
//     canvasColor: Colors.black,
//   );
// }
abstract class Style {
  static const appBackground = Color(0xffd0d0d0);
  static const appDrawerHeaderColor = Colors.deepOrange;
  
  static const headTitle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}


import 'package:flutter/material.dart';

var lightTheme=ThemeData(
  // brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

textTheme: TextTheme(
     headlineLarge: TextStyle(
       fontSize: 48,
       fontWeight: FontWeight.w800,
       fontFamily: "FiraSans",
       color: Color(0xff3C3C3C)
     ),
     headlineMedium: TextStyle(
         fontSize: 30,
         fontWeight: FontWeight.w700,
         fontFamily: "FiraSans",
         color: Color(0xff3C3C3C)
     ),
  titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: "FiraSans",
      color: Color(0xff616161)
  )
   )
    );
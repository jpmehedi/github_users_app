import 'package:flutter/material.dart';

class CustomDarkTheme {
  static ThemeData customDarkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 30),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 25),
    ),
  );
}
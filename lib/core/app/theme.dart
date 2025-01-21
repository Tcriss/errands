import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.grey.shade200,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade200,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    buttonColor: Colors.blue  
  )
);

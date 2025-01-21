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
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.grey.shade200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  )
);

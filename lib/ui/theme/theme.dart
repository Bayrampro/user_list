import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 127, 44)),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Color.fromARGB(255, 41, 127, 44),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: Color.fromARGB(255, 41, 127, 44),
    ),
    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 41, 127, 44),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 41, 127, 44),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 41, 127, 44),
    ),
  ),
);

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 22, 57, 22),
  ),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 63, 27)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 22, 57, 22),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 24, 103, 27),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
);

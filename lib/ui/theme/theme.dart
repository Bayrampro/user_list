import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 127, 44)),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);

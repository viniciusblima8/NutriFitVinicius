import 'package:flutter/material.dart';

class NutriFitColors {
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color backgroundLight = Color(0xFFE8F5E9);
  static const Color surface = Colors.white;
}

class NutriFitTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: NutriFitColors.primary,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      fontFamily: 'Roboto',
    );
  }
}

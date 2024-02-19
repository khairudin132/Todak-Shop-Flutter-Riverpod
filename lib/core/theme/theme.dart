import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
  ).copyWith(
    cardTheme: themeData.cardTheme,
    inputDecorationTheme: themeData.inputDecorationTheme,
    outlinedButtonTheme: themeData.outlinedButtonTheme,
    filledButtonTheme: themeData.filledButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
  ).copyWith(
    cardTheme: themeData.cardTheme,
    inputDecorationTheme: themeData.inputDecorationTheme,
    outlinedButtonTheme: themeData.outlinedButtonTheme,
    filledButtonTheme: themeData.filledButtonTheme,
  );
}

import 'package:flutter/material.dart';

import '../constants/constants.dart';

final _fixedSize = MaterialStateProperty.all(const Size.fromHeight(50));

final _borderRadius = BorderRadius.circular(Constant.radius);

final _outlinedInputBorder = OutlineInputBorder(borderRadius: _borderRadius);

final _buttonShape = MaterialStateProperty.all(
  RoundedRectangleBorder(borderRadius: _borderRadius),
);

final themeData = ThemeData(
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: _borderRadius,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.all(15),
    enabledBorder: _outlinedInputBorder,
    border: _outlinedInputBorder,
    focusedBorder: _outlinedInputBorder,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: _fixedSize,
      shape: _buttonShape,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: _fixedSize,
      shape: _buttonShape,
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
          fontSize: 18,
          letterSpacing: 0.5,
        ),
      ),
    ),
  ),
);

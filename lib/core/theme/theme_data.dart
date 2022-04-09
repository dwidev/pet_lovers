import 'package:flutter/material.dart';

import 'theme_constant.dart';

/// getter for theme app pet lovers
ThemeData get baseTheme {
  return ThemeData(
    fontFamily: PLThemeConstant.fontFamilly,
    disabledColor: PLThemeConstant.lightPrimary,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}

/// getter for card theme
CardTheme get _cardTheme {
  return CardTheme(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PLThemeConstant.radius),
    ),
  );
}

/// getters for button theme
ElevatedButtonThemeData get _elevatedButtonTheme {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(
        PLThemeConstant.elevation,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PLThemeConstant.radius),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return PLThemeConstant.lightPrimary;
          }

          return PLThemeConstant.pinkPrimary;
        },
      ),
    ),
  );
}

/// getters for text theme global
TextTheme get _textTheme {
  return const TextTheme(
    headline1: TextStyle(
      color: PLThemeConstant.blackPrimary,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: PLThemeConstant.blackPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: PLThemeConstant.blackPrimary,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
    caption: TextStyle(
      color: PLThemeConstant.blackPrimary,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}

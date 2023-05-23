import 'package:flutter/material.dart';

import 'theme_constant.dart';

/// getter for theme app pet lovers
ThemeData get baseTheme {
  return ThemeData(
    unselectedWidgetColor: PLThemeConstant.unselectedColor,
    primaryColor: PLThemeConstant.pinkPrimary,
    primarySwatch: const MaterialColor(PLThemeConstant.pinkPrimaryInt, {
      50: PLThemeConstant.pinkPrimary,
      100: PLThemeConstant.pinkPrimary,
      200: PLThemeConstant.pinkPrimary,
      300: PLThemeConstant.pinkPrimary,
      400: PLThemeConstant.pinkPrimary,
      500: PLThemeConstant.pinkPrimary,
      600: PLThemeConstant.pinkPrimary,
      700: PLThemeConstant.pinkPrimary,
      800: PLThemeConstant.pinkPrimary,
      900: PLThemeConstant.pinkPrimary,
    }),
    fontFamily: PLThemeConstant.fontFamilly,
    disabledColor: PLThemeConstant.lightPrimary,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textButtonTheme: _textThemeButton,
  );
}

TextButtonThemeData get _textThemeButton {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}

InputDecorationTheme get _inputDecorationTheme {
  return InputDecorationTheme(
    filled: true,
    fillColor: PLThemeConstant.white,
    hintStyle: TextStyle(
      fontSize: 13,
      color: PLThemeConstant.blackPrimary.withOpacity(0.5),
    ),
    labelStyle: TextStyle(
      fontSize: 13,
      color: PLThemeConstant.blackPrimary.withOpacity(0.5),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: PLThemeConstant.sizeS,
    ),
    border: OutlineInputBorder(
      borderRadius: PLThemeConstant.cardBorderRadius,
      borderSide: BorderSide.none,
    ),
  );
}

/// getter for card theme
CardTheme get _cardTheme {
  return CardTheme(
    elevation: 5,
    shadowColor: PLThemeConstant.lightPrimary.withOpacity(0.7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PLThemeConstant.radius),
    ),
  );
}

/// getters for button theme
ElevatedButtonThemeData get _elevatedButtonTheme {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      // shape: MaterialStateProperty.all(
      //   RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(PLThemeConstant.radius),
      //   ),
      // ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return PLThemeConstant.unselectedColor;
          }

          return PLThemeConstant.pinkPrimary;
        },
      ),
    ),
  );
}

/// getters for button theme
OutlinedButtonThemeData get _outlinedButtonTheme {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: PLThemeConstant.blackPrimary,
          fontSize: 12,
        ),
      ),
    ),
  );
}

/// getters for text theme global
TextTheme get _textTheme {
  return const TextTheme(
    displayLarge: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 8,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: PLThemeConstant.blackPrimary,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}

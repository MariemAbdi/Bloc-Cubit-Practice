import 'package:flutter/material.dart';

final themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
      fillColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) =>
            BorderSide(width: 1.5, color: Colors.blueGrey.withOpacity(0.7)),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 16),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Color(0xFF747171)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.redAccent),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    )
);

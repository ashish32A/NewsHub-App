import 'package:flutter/material.dart';
import 'package:newshub/config/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
      fillColor: lightBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: lightLabelColor,
      labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w500),
      hintStyle: TextStyle(
          fontSize: 15, color: lightFontColor, fontWeight: FontWeight.w500)),
  colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: lightDivColor,
      onPrimary: lightFontColor,
      secondary: lightLabelColor,
      secondaryContainer: lightLabelColor,
      surface: lightBgColor,
      onSurface: lightFontColor),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          color: lightFontColor,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: lightFontColor,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: lightFontColor,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: lightFontColor,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: lightLabelColor,
          fontWeight: FontWeight.w300)),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: darkLabelColor,
      labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w500),
      hintStyle: TextStyle(
          fontSize: 15, color: darkFontColor, fontWeight: FontWeight.w500)),
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 63, 75, 52),
      onPrimary: darkFontColor,
      secondary: darkLabelColor,
      secondaryContainer: darkBgColor,
      surface: darkBgColor,
      onSurface: darkFontColor),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          color: darkFontColor,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: darkFontColor,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: darkFontColor,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: darkFontColor,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13,
          color: darkLabelColor,
          fontWeight: FontWeight.w300)),
);

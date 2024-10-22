import 'package:flutter/material.dart';

@immutable
final class CustomThemeData {
  static const Color primaryColor = Color(0xFFc7dcf9);
  static const Color scaffoldBackgroundColor = Color(0xffF5F5F5);
  static const Color dialogBackgroundColor = Color(0xffFFFFFF);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color disabledColor = Color(0xffbcbcbc);
  static const Color backgroudColor = Color(0xffF4F4F4);

  static const Color disabledColorDark = Color(0xff6E6E6E);
  static const Color blackColor = Color(0xff000000);
  static const Color blackColorLight = Color(0xff595959);

  static const Color blueColor = Color(0xFF355489);
  static const Color blueColorDark = Color(0xff061434);

  static const Color redColor = Color.fromARGB(255, 219, 57, 57);

  static ThemeData customLightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryColor: primaryColor,
    primaryColorLight: blueColor,
    primaryColorDark: blueColorDark,
    primarySwatch: Colors.blue,
    hintColor: disabledColor,
    cardColor: whiteColor,
    dialogBackgroundColor: whiteColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        extendedSizeConstraints:
            BoxConstraints.tightFor(height: 40, width: 50)),
    textTheme: const TextTheme(
      displayMedium: TextStyle(),
      displaySmall: TextStyle(),
    ).apply(
      bodyColor: blackColor,
      displayColor: blackColor,
    ),
  );
}

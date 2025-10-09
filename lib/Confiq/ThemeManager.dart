import 'package:flutter/material.dart';
import '../Core/ColorsManager.dart';
abstract class ThemeManager {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.green),
      titleTextStyle: TextStyle(
        color: ColorsManager.darkBlack,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    primaryColorDark: ColorsManager.Greyissh,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      selectedItemColor: ColorsManager.green,
      unselectedItemColor: ColorsManager.Greyissh,
    ),
    textTheme:  TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
      bodySmall: TextStyle(color: Colors.black54, fontSize: 14),
    ),
  );
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManager.darkBlack,
    primaryColor: ColorsManager.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.Greyissh,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.green),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkGrey,
      selectedItemColor: ColorsManager.green,
      unselectedItemColor: Colors.grey,
    ),
    primaryColorDark: ColorsManager.darkGrey,
    textTheme:  TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
      bodySmall: TextStyle(color: Colors.white60, fontSize: 14),
    ),
  );
}

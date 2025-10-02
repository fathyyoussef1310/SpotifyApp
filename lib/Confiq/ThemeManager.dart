import 'package:flutter/material.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';

abstract class ThemeManager{
  static final ThemeData light=  ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.white,
    primaryColorDark: ColorsManager.green,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
    ),

  );
  static final ThemeData darkMode= ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkGrey,
    primaryColor: ColorsManager.darkGrey,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.Greyissh,
    )
  );
}
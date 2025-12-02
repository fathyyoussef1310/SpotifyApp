import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/Confiq/ThemeManager.dart';

class ThemeController extends GetxController
{
 var isDark=false.obs;
 ThemeData get theme => isDark.value ? ThemeManager.dark : ThemeManager.light;
 Future<void>toggleData(bool darkMode)async{
   isDark.value=darkMode;
   Get.changeTheme(theme);
   SharedPreferences prefs=await SharedPreferences.getInstance();
   prefs.setBool("isDark", darkMode);
 }
 Future<void>loadData()async {
 final SharedPreferences _prefs=await SharedPreferences.getInstance();
 final Saved=_prefs.getBool("isDark") ?? false;
 isDark.value=Saved;
 Get.changeTheme(theme);
 }
}
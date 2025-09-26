import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Features/Auth/Choose_Login_register.dart';
import '../Features/Auth/LoginScreen.dart';
import '../Features/Auth/RegisterScreen.dart';
import '../Features/ChooseTheme.dart';
import '../Features/MainFeatures/Home/HomeScreen.dart';
import '../Features/MainFeatures/LayoutScreen.dart';
import '../Features/MainFeatures/profile/ProfileScreen.dart';

class RoutesManager {
  static const String onboardingScreen = '/onboarding';
  static const String chooseTheme = '/choose';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPass = '/forgetPass';
  static const String profileScreen = '/profile';
  static const String layoutScreen = '/layout';
  static const String homeScreen = '/home';
  static const String favorites='/favourites';
  static const String chooseLoginRegister = '/chooseLoginRegister';
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case chooseTheme:
        return CupertinoPageRoute(builder: (_) => const Choosetheme());
      case loginScreen:
        return CupertinoPageRoute(builder: (_) =>  Loginscreen());
      case registerScreen:
        return CupertinoPageRoute(builder: (_) =>  Registerscreen());
      case chooseLoginRegister:
        return CupertinoPageRoute(builder: (_) => const ChooseLoginRegister());
    case profileScreen:
      return CupertinoPageRoute(builder: (_) => const Profilescreen());
    case layoutScreen:
      return CupertinoPageRoute(builder: (_) => LayoutScreen());
    case homeScreen:
      return CupertinoPageRoute(builder: (_) => const Homescreen());
      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route found")),
          ),
        );
    }
  }
}

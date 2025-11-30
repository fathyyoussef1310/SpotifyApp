import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/Features/Auth/Choose_Login_register.dart';
import 'package:spotifyyapp/Features/ChooseTheme.dart';
import 'package:spotifyyapp/Features/Onboarding/OnboardingScreen.dart';
import 'Controllers/ThemeController.dart';
import 'Core/RoutesManager.dart';
import 'Features/MainFeatures/Home/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
  final completeAuth = prefs.getBool('completeAuth') ?? false;
  final themeController = Get.put(ThemeController());
  await themeController.loadData();
  runApp(MyApp(onboardingSeen: onboardingSeen, completeAuth: completeAuth, themeController: themeController,));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  final bool onboardingSeen;
  final bool completeAuth;

  const MyApp({
    super.key,
    required this.themeController,
    required this.onboardingSeen,
    required this.completeAuth,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.getRoute,
          theme: themeController.theme,
          home: !onboardingSeen ? OnBoardingScreen() : !completeAuth ? Homescreen() : ChooseLoginRegister(),
        ));
      },
    );
  }
}

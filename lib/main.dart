import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Your feature imports
import 'package:spotifyyapp/Features/Auth/Choose_Login_register.dart';
import 'package:spotifyyapp/Features/Auth/LoginScreen.dart';
import 'package:spotifyyapp/Features/Onboarding/OnboardingScreen.dart';
import 'package:spotifyyapp/Features/MainFeatures/LayoutScreen.dart';
import 'Controllers/ThemeController.dart';
import 'Core/RoutesManager.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 1. Load SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final bool onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
    final bool completeAuth = prefs.getBool('completeAuth') ?? false;

    // 2. SAFE FIREBASE INITIALIZATION
    // Check if Firebase is already initialized to avoid the [duplicate-app] error
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ).timeout(const Duration(seconds: 10));
      debugPrint("Firebase initialized successfully.");
    } else {
      debugPrint("Firebase already initialized, skipping...");
    }
    final themeController = Get.put(ThemeController());
    await themeController.loadData().timeout(const Duration(seconds: 5), onTimeout: () {
      debugPrint("Theme loading timed out.");
    });

    runApp(MyApp(
      onboardingSeen: onboardingSeen,
      completeAuth: completeAuth,
      themeController: themeController,
    ));
  } catch (e) {
    debugPrint("Initialization Error: $e");
    if (e.toString().contains('duplicate-app')) {
      runApp(MyApp(
        onboardingSeen: false,
        completeAuth: false,
        themeController: Get.put(ThemeController()),
      ));
    }
  }
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
    Widget getInitialScreen() {
      if (!onboardingSeen) {
        return  OnBoardingScreen();
      } else if (!completeAuth) {
        return  ChooseLoginRegister();
      } else {
        return  LayoutScreen();
      }
    }

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.getRoute,
          theme: themeController.theme,
          home: getInitialScreen(),
        ));
      },
    );
  }
}
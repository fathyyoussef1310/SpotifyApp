import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/Onboarding/OnboardingScreen.dart';
import 'Features/Auth/Choose_Login_register.dart';
import 'Features/MainFeatures/LayoutScreen.dart';
import 'Controllers/ThemeController.dart';
import 'Core/RoutesManager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  bool onboardingSeen = false;
  bool completeAuth = false;
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      debugPrint("✅ Firebase initialized successfully");
    } else {
      debugPrint("ℹ️ Firebase already initialized, skipping");
    }
  } catch (e) {
    debugPrint("⚠️ Firebase initialization failed: $e");
  }
  try {
    final prefs = await SharedPreferences.getInstance();
    onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
    completeAuth = prefs.getBool('completeAuth') ?? false;
    debugPrint(
        "ℹ️ Onboarding: $onboardingSeen | CompleteAuth: $completeAuth");
  } catch (e) {
    debugPrint("⚠️ SharedPreferences error: $e");
  }
  final themeController = Get.put(ThemeController());
  try {
    await themeController.loadData();
  } catch (e) {
    debugPrint("⚠️ ThemeController load error: $e");
  }
  FlutterNativeSplash.remove();

  runApp(MyApp(
    onboardingSeen: onboardingSeen,
    completeAuth: completeAuth,
    themeController: themeController,
  ));
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
        return OnBoardingScreen();
      } else if (!completeAuth) {
        return ChooseLoginRegister();
      } else {
        return LayoutScreen();
      }
    }

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
              () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.getRoute,
            theme: themeController.theme,
            home: getInitialScreen(),
          ),
        );
      },
    );
  }
}

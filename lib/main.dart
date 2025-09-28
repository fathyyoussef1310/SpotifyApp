import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/Features/Auth/Choose_Login_register.dart';
import 'package:spotifyyapp/Features/Auth/LoginScreen.dart';
import 'package:spotifyyapp/Features/Onboarding/OnboardingScreen.dart';
import 'Core/RoutesManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
  runApp(MyApp(onboardingSeen: onboardingSeen));
}
class MyApp extends StatelessWidget {
  final bool onboardingSeen;
  const MyApp({required this.onboardingSeen, super.key});
  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.getRoute,
          home: onboardingSeen ? ChooseLoginRegister() : OnBoardingScreen(),
        );
      },
    );
  }
}

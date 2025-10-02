import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/Confiq/ThemeManager.dart';
import 'package:spotifyyapp/Features/Auth/Choose_Login_register.dart';
import 'package:spotifyyapp/Features/Auth/LoginScreen.dart';
import 'package:spotifyyapp/Features/ChooseTheme.dart';
import 'package:spotifyyapp/Features/Onboarding/OnboardingScreen.dart';
import 'Controllers/ThemeController.dart';
import 'Core/RoutesManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
  final _completeAuth = prefs.getBool('') ?? false;
  runApp(MyApp(onboardingSeen: onboardingSeen, completeAuth: _completeAuth,),);
}
class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final bool onboardingSeen;
  final bool completeAuth;
   MyApp({required this.completeAuth,required this.onboardingSeen, super.key});
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
          theme: themeController.theme,
          home:!onboardingSeen ? OnBoardingScreen() : !completeAuth ? Choosetheme() : ChooseLoginRegister(),
        );
      },
    );
  }
}

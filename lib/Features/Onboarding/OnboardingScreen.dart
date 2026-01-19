import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/ColorsManager.dart';
import '../../Core/ImagesManager.dart';
import '../../Core/RoutesManager.dart';
import '../../Core/Widgets/CustomeElevatedButton.dart';

const String kOnboardingSeen = 'onboarding_seen';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kOnboardingSeen, true);

    Navigator.pushReplacementNamed(context,
      RoutesManager.chooseLoginRegister,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlack,
      body: Stack(
        children: [
          Image.asset(
            assetsManager.onBoardingScreen,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(color: Colors.black.withOpacity(0.4)),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enjoy listening to music",
                  style: GoogleFonts.poppins(
                    color: ColorsManager.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Discover your favorite Quran with no limits.", style: GoogleFonts.poppins(
                    color: ColorsManager.whiteGrey,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                CustomElevatedButton(
                  onPressed: () => _completeOnboarding(context),
                  title: "Get Started",
                  backgroundColor: ColorsManager.green,
                  foregroundColor: ColorsManager.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';
import 'package:spotifyyapp/Core/RoutesManager.dart';
import 'package:spotifyyapp/Core/Widgets/CustomeElevatedButton.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    Navigator.pushReplacementNamed(context, RoutesManager.chooseLoginRegister);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlack,
      body: PageView(
        children: [
          Stack(
            children: [
              Image.asset(
                assetsManager.onBoardingScreen,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                color: ColorsManager.darkBlack.withOpacity(0.4),
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 57.sp),
                    Text("Enjoy listening to music", style: GoogleFonts.poppins(color: ColorsManager.whiteGrey, fontSize: 25.sp, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      "Discover your favorite music and Quran, listen without limits, and enjoy an unmatched audio experience",
                      style: GoogleFonts.poppins(color: ColorsManager.Greyissh, fontSize: 20.sp,),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.sp),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () => _completeOnboarding(context),
                            title: "Get Started",
                            backgroundColor: ColorsManager.green,
                            foregroundColor: ColorsManager.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

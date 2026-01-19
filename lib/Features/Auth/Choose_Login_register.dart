import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/ColorsManager.dart';
import '../../Core/ImagesManager.dart';
import '../../Core/RoutesManager.dart';
import '../../Core/Widgets/CustomeElevatedButton.dart';
import '../../Core/Widgets/TextButton.dart';

class ChooseLoginRegister extends StatelessWidget {
  const ChooseLoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(assetsManager.SpotifyLogo),
                  SizedBox(height: 40.h),
                  CustomTextButton(
                    title: "Sign In",
                    color: Theme.of(context).primaryColorDark,
                    size: 28.sp,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.loginScreen,
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                        RoutesManager.registerScreen,
                      );
                    },
                    title: "Register",
                    backgroundColor: ColorsManager.green,
                    foregroundColor: ColorsManager.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

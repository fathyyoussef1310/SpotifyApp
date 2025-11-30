import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/ColorsManager.dart';
import '../../Core/ImagesManager.dart';
import '../../Core/RoutesManager.dart';
import '../../Core/Widgets/CustomeElevatedButton.dart';
import '../../Core/Widgets/TextButton.dart';
class ChooseLoginRegister extends StatelessWidget {
  const ChooseLoginRegister({super.key});
  Future<void> _completeAuth(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('_completeAuth', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child:Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(assetsManager.celebLoginre),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 77.sp,),
                  Image.asset(assetsManager.SpotifyLogo),
                  SizedBox(height: 20.h,),
                  Text("Enjoy listening to music",style: GoogleFonts.inter(color: ColorsManager.white,fontSize: 29.sp),),
                  Text("Spotify is a proprietary International audio\nstreaming and media services provider ",style: GoogleFonts.inter(color: ColorsManager.whiteGrey.withOpacity(0.8),fontSize: 17.sp),),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:  REdgeInsets.symmetric(horizontal: 50.sp,vertical: 20.sp),
                        child: CustomTextButton(title: "Sign In",color: Theme.of(context).primaryColorDark, onPressed: (){
                          Navigator.pushNamed(context, RoutesManager.loginScreen);
                        }, size: 30.sp,),
                      ),
                      SizedBox(width: 40.w,),
                      CustomElevatedButton(onPressed: (){
                        _completeAuth(context);
                        Navigator.pushNamed(context, RoutesManager.registerScreen);
                      }, title: "Register", backgroundColor: ColorsManager.green, foregroundColor: ColorsManager.white),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

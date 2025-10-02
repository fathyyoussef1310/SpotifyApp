import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Controllers/ThemeController.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';
import 'package:spotifyyapp/Core/RoutesManager.dart';
import 'package:spotifyyapp/Core/Widgets/CustomeElevatedButton.dart';
import '../Core/ColorsManager.dart';

class Choosetheme extends StatelessWidget {
  Choosetheme({super.key});
  ThemeController themeController=Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Greyissh,
      body: Stack(
        children: [
          Image.asset(assetsManager.onBoardingScreen,height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                    child: Expanded(child: Image.asset(assetsManager.SpotifyLogo,width: 200.w,height: 60.h,))),
                SizedBox(height: 470.h,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Choose Theme",style: GoogleFonts.poppins(color: ColorsManager.white,fontSize: 30.sp,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: ColorsManager.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: IconButton(onPressed: () {
                                      Get.find<ThemeController>().toggleData(false);
                                    }, icon: Icon(Icons.light_mode, color: ColorsManager.white, size: 50),),
                                  ),
                                ),
                              ),
                              Text("LightMode", style: GoogleFonts.poppins(color: ColorsManager.white, fontWeight: FontWeight.bold, fontSize: 16.sp,),
                              ),
                            ],
                          ),
                          SizedBox(width: 50.w),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.sp),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: ColorsManager.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20.sp),
                                    ),
                                    child: IconButton(onPressed: () {
                                      Get.find<ThemeController>().toggleData(true);
                                    }, icon: Icon(Icons.dark_mode, color: ColorsManager.white, size: 50),),
                                  ),
                                ),
                              ),
                              Text("DarkMode", style: GoogleFonts.poppins(color: ColorsManager.white, fontWeight: FontWeight.bold, fontSize: 16.sp,),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          Expanded(child: CustomElevatedButton(onPressed: (){
                            Navigator.pushReplacementNamed(context, RoutesManager.layoutScreen);
                          }, title: "Get Started", backgroundColor: ColorsManager.green, foregroundColor: ColorsManager.white)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

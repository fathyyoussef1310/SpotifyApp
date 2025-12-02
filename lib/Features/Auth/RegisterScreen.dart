import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Controllers/registerController.dart';
import '../../Core/ColorsManager.dart';
import '../../Core/CustomTextFormField.dart';
import '../../Core/ImagesManager.dart';
import '../../Core/RoutesManager.dart';
import '../../Core/Widgets/CustomeElevatedButton.dart';
import '../../Core/Widgets/TextButton.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});
  final RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesManager.chooseLoginRegister);
                    },
                    icon: Icon(Icons.arrow_back, color: ColorsManager.Greyissh),
                  ),
                  SizedBox(width: 110.w),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      assetsManager.SpotifyLogo,
                      width: 108.w,
                      height: 33.h,
                    ),
                  ),
                ],
              ),
            ),
            Text("Register", style: GoogleFonts.poppins(color: ColorsManager.whiteGrey, fontWeight: FontWeight.bold, fontSize: 30.sp,),),
            SizedBox(height: 30.sp),
            Customtextformfield(
              hint: "Name",
              label: "Name",
              color: ColorsManager.whiteGrey,
              controller: registerController.nameController,
            ),
            SizedBox(height: 20.sp),
            Customtextformfield(
              hint: "Email",
              label: "Email",
              color: ColorsManager.whiteGrey,
              prefixIcon: Icons.email,
              controller: registerController.emailController,
            ),
            SizedBox(height: 20.sp),
            Customtextformfield(
              hint: "Password",
              label: "Password",
              color: ColorsManager.whiteGrey,
              suffixIcon: Icons.visibility,
              controller: registerController.passwordController,
            ),
            SizedBox(height: 20.sp),
            Customtextformfield(
              hint: "Confirm Your Password",
              label: "Confirm Your Password",
              color: ColorsManager.whiteGrey,
              suffixIcon: Icons.visibility_off,
              controller: registerController.confirmPassController,
            ),
            SizedBox(height: 40.sp),
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    return registerController.isLoading.value ? Center(child: CircularProgressIndicator(color: ColorsManager.green)) : CustomElevatedButton(
                      onPressed: () {
                        registerController.registerWithEmail();
                      },
                      title: "Create One",
                      backgroundColor: ColorsManager.green,
                      foregroundColor: ColorsManager.white,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: ColorsManager.whiteGrey,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 10.sp),
                      child: Text("Or", style: GoogleFonts.poppins(color: ColorsManager.Greyissh, fontSize: 16.sp,),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: ColorsManager.whiteGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(assetsManager.google),
                    SizedBox(width: 40.w),
                    Image.asset(assetsManager.iphone),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an account?", style: GoogleFonts.poppins(color: ColorsManager.whiteGrey, fontSize: 12.sp),),
                    CustomTextButton(title: " Sign in",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
                      }, size: 12.sp, color: ColorsManager.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

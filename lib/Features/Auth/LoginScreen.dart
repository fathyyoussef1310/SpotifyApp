import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/AuthCubit/auth_cubit.dart';
import 'package:spotifyyapp/AuthCubit/auth_state.dart';
import '../../Core/ColorsManager.dart';
import '../../Core/CustomTextFormField.dart';
import '../../Core/ImagesManager.dart';
import '../../Core/RoutesManager.dart';
import '../../Core/Widgets/CustomeElevatedButton.dart';
import '../../Core/Widgets/TextButton.dart';
class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController email=TextEditingController();
  final TextEditingController Password=TextEditingController();
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
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:Icon(Icons.arrow_back)),
                  SizedBox(width:110.w),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(assetsManager.SpotifyLogo,width: 108.w,height: 33.h,)
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Sign In",style: GoogleFonts.poppins(color: ColorsManager.whiteGrey,fontSize: 50.sp,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You Don't Have One ?",style: GoogleFonts.poppins(color: ColorsManager.Greyissh,fontSize: 18.sp,fontWeight: FontWeight.w200)),
                        CustomTextButton(title: "Click Here ",color: ColorsManager.green, onPressed: (){
                          Navigator.pushNamed(context, RoutesManager.registerScreen);
                        }, size: 20.sp,)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding:  REdgeInsets.all(10.0),
                      child: Customtextformfield(
                        hint: "Enter username or email",
                        label: "Email or Username",
                        color: ColorsManager.whiteGrey,
                        prefixIcon: Icons.email_outlined,
                        controller:email,
                      ),
                    ),
                    SizedBox(height: 11.h,),
                    Padding(
                      padding:  REdgeInsets.all(10.0),
                      child: Customtextformfield(
                          hint: "Password",
                          label: "Password",
                          color:ColorsManager.whiteGrey,
                          suffixIcon: Icons.visibility,
                         controller:Password,
                      ),
                    ),
                    SizedBox(height: 2.sp,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomTextButton(title: "Recover Your Password", onPressed: (){
                        Navigator.pushReplacementNamed(context, RoutesManager.registerScreen);
                      }, size: 18.sp,color: ColorsManager.whiteGrey,),
                    ),
                    Padding(
                      padding:  REdgeInsets.all(20.0.sp),
                      child: Expanded(
                        child: Column(
                          children: [
                            BlocConsumer<AuthCubit,AuthState>(builder: (context,state){
                              if(state  is AuthLoading){
                                return Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
                              }
                              return CustomElevatedButton(onPressed: (){
                                context.read<AuthCubit>().login(email.text.trim(), Password.text.trim());
                              }, title: "Log In",
                                  backgroundColor: ColorsManager.green, foregroundColor: ColorsManager.white);
                            }, listener:(context,state){
                              if(state is AuthAuthenticated){
                                Navigator.pushReplacementNamed(context, RoutesManager.layoutScreen);
                              }
                              if(state is AuthUnAuthenticated){
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(state.error,),
                                    backgroundColor: ColorsManager.red,
                                  ),
                                );
                              }
                            })
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorsManager.whiteGrey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text("OR", style: GoogleFonts.poppins(color: ColorsManager.whiteGrey, fontSize: 14.sp, fontWeight: FontWeight.w600,),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: ColorsManager.whiteGrey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  REdgeInsets.symmetric(horizontal: 150.0.sp,vertical: 20.sp),
                      child: Row(
                        children: [
                          Image.asset(assetsManager.google),
                          SizedBox(width: 80.sp,),
                          Image.asset(assetsManager.iphone),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  REdgeInsets.symmetric(horizontal: 120.sp,vertical: 50.sp),
                      child: Row(
                        children: [
                          Text("Not a Member?",style: GoogleFonts.poppins(color: ColorsManager.whiteGrey,fontSize: 12.sp,fontWeight: FontWeight.normal),),
                          SizedBox(width: 1.sp,),
                          CustomTextButton(title: "Register Now", onPressed: (){
                            Navigator.pushReplacementNamed(context, RoutesManager.registerScreen);
                          }, size: 12.sp,color: ColorsManager.green,)
                        ],
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
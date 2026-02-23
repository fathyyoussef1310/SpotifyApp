import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Controllers/registerController.dart';
import '../../../Controllers/ProfileController.dart';
import '../../../Controllers/registerController.dart';
import '../../../Core/ColorsManager.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final  ProfileController profileController =Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 290.h,
            decoration: BoxDecoration(
              color: ColorsManager.Greyissh,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.r),
                bottom: Radius.circular(80.r),
              ),
            ),
            child: Obx(() {
              if (profileController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Text(
                  profileController.email.value,
                  style: GoogleFonts.inter(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

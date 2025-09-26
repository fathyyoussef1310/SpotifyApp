import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorsManager.dart';

class Customtextformfield extends StatelessWidget {
    Customtextformfield({super.key,required this.hint, required this.label,required this.color, this.suffixIcon, this.prefixIcon,this.maxLines=1,this.controller,this.onChanged,this.validator});
    String hint;
    String label;
    Color color;
    IconData? suffixIcon;
    IconData? prefixIcon;
    int maxLines;
    TextEditingController? controller;
    String? Function(String?)? validator;
    dynamic onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(color: ColorsManager.white,fontSize: 16.sp,fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: GoogleFonts.poppins(color: color,fontSize: 16.sp,fontWeight: FontWeight.w700),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: ColorsManager.green,fontSize: 16.sp,fontWeight: FontWeight.w700),
        suffixIcon: suffixIcon!=null ? Icon(suffixIcon,color: color,) : null,
        prefixIcon: prefixIcon!=null ? Icon(prefixIcon,color: color,) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.Greyissh, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
        ),
        filled: false,
      ),
      onChanged:onChanged,
      controller: controller,
      validator: validator,
      maxLines: maxLines,
    );
  }
}

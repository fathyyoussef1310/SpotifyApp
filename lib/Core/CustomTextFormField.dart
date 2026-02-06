import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/data/QuranResponse.dart';
import 'ColorsManager.dart';
class Customtextformfield extends StatelessWidget {
  final String hint;
  final String label;
  final Color color;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  const Customtextformfield({
    super.key,
    required this.hint,
    required this.label,
    required this.color,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.validator,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      style: GoogleFonts.poppins(
        color: Theme.of(context).brightness == Brightness.dark ? ColorsManager.white : ColorsManager.darkBlack,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: color, fontSize: 16.sp, fontWeight: FontWeight.w700),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: ColorsManager.green, fontSize: 16.sp),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: color) : null,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: color) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.Greyissh, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.green, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
        ),
      ),
    );
  }
}

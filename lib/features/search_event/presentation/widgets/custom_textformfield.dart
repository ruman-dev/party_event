import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.trailingIcon,
    this.height,
    this.ImgColor,
  });

  final String title;
  final String trailingIcon;
  final double? height;
  final Color? ImgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: height ?? 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.5, color: Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor,
            ),
          ),
          Image.asset(
            trailingIcon,
            width: 21.w,
            height: 24.h,
            color: ImgColor ?? AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}

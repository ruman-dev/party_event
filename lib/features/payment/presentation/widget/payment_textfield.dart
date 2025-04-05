import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';

class PaymentTextfield extends StatelessWidget {
  const PaymentTextfield({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validationMessage,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final String? validationMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return validationMessage ?? 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.w),
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E8F0),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E8F0),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE2E8F0),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/routes/app_route.dart';

import 'custom_btn.dart';

class ShowDialog4 extends StatelessWidget {
  ShowDialog4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 230.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44.r), topRight: Radius.circular(44.r)),
          color: Color(0xFFFEFEFE),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 15.h),
          Container(
            height: 4.h,
            width: 42.w,
            decoration: BoxDecoration(
              color: Color(0x33718096),
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Logout',
            style: GoogleFonts.urbanist(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4EB323),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: Color(0xFFE2E8F0),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Are you sure you want to log out?",
            style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A202C)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomBtn(
                    textColor: Color(0xFF337617),
                    borderRadius: BorderRadius.circular(100.r),
                    text: 'Cancel',
                    onPressed: () {},
                    // textColor: AppColors.primaryColor,
                    backgroundColor: Color(0xFFD2F3C3),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomBtn(
                    textColor: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(100.r),
                    text: 'Yes, Logout',
                    onPressed: () {
                      Get.offAllNamed(AppRoute.signInScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}

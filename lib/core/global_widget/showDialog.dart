import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.sp),
        color: Color(0xFFFEFEFE),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            AssetPath.conger,
            height: 100.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Your account has been\n verified susccessfully',
            style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomBtn(
              width: 150.w,
              text: "Done",
              onPressed: () {
                Get.toNamed(AppRoute.signInScreen);
              })
        ],
      ),
    );
  }
}

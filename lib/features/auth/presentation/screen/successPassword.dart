import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';

class Successpassword extends StatelessWidget {
  const Successpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Image.asset(AssetPath.close),
            )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                AssetPath.successPass,
                width: 200.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Password Changed",
                style: GoogleFonts.inter(
                  color: Color(0xFF1A202C),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Password changed succesfully, you\n can login again with new password",
                style: GoogleFonts.inter(
                  color: Color(0xFF718096),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 270.h,
              ),
              CustomBtn(
                  text: "Log In",
                  onPressed: () {
                    Get.toNamed(AppRoute.signInScreen);
                  }),
              // SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}

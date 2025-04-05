import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/routes/app_route.dart';
import '../../../../core/global_widget/custom_btn.dart';
import '../../../../core/global_widget/custom_text_field.dart';
import '../../../../core/utils/asset_path.dart';

class ResetPassword extends StatelessWidget {
  final String selectedMethod;
  ResetPassword({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Image.asset(AssetPath.appleadin),
              ))),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A202C)),
            ),
            Text(
              "Enter your $selectedMethod, we will send a verification code to your $selectedMethod",
              style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF718096C)),
            ),
            SizedBox(height: 20.h),
            if (selectedMethod == "email")
              CustomTextField(
                prefiesIcnColor: Color(0xFF337617),
                prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
                hintText: "hello@rafiislam",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF1A202C)),
              ),
            if (selectedMethod == "phone")
              CustomTextField(
                prefiesIcnColor: Color(0xFF337617),
                prefixIcon: Icon(Icons.phone, size: 20.sp),
                hintText: "(+1) 446565214|",
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xFF1A202C)),
              ),
            Spacer(),
            CustomBtn(
                text: "Send Code",
                onPressed: () {
                  Get.toNamed(AppRoute.otpScreen);
                }),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

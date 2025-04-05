import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_text_field.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/auth/controller/switch/switch_controller.dart';
import 'package:party_event/features/nav_bar/screen/bottom_nav_bar.dart';

import '../../../../core/helper/from_validator.dart';
import '../../controller/auth_controller.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});

  final singUpFormKey = GlobalKey<FormState>();
  final AuthController authenticationController = Get.put(AuthController());

  final SwitchController controller = Get.put(SwitchController());

  // final bool isOrganizer;

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
              child: Image.asset(AssetPath.appleadin),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Form(
            key: singUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A202C)),
                ),
                Text(
                  "Create account and enjoy all services",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF718096)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  validator: FormValidation.validateUsername,
                  textEditingController:
                      authenticationController.singUpUserName,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Image.asset(
                      AssetPath.profileIcon,
                      width: 12.w,
                    ),
                  ),
                  prefiesIcnColor: Color(0xFF718096),
                  hintText: "Username",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Color(0xFF718096)),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  validator: FormValidation.validateEmail,
                  textEditingController: authenticationController.singUpEmail,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 20.sp,
                  ),
                  prefiesIcnColor: Color(0xFF718096),
                  hintText: "Email",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Color(0xFF718096)),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  validator: FormValidation.validatePassword,
                  textEditingController:
                      authenticationController.singUpPassword,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Image.asset(
                    AssetPath.lock1,
                    width: 20.w,
                  ),
                  prefiesIcnColor: Color(0xFF718096),
                  isPassword: true,
                  hintText: "Password",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Color(0xFF718096)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomBtn(
                    text: "Sign Up",
                    onPressed: () {
                      if (singUpFormKey.currentState!.validate()) {
                        Get.toNamed(AppRoute.singUpVerify);
                      }
                    }),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFFE9EBED),
                        thickness: 2,
                        endIndent: 20,
                        indent: 6,
                      ),
                    ),
                    Text(
                      "Or Sign In with",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF636F85),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xFFE9EBED),
                        thickness: 2,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(BottomNavBar(isOrganizer: true.obs));
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side:
                              BorderSide(width: 1.w, color: Color(0xFFE2E8F0))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPath.google,
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Continue with Google",
                          style: GoogleFonts.inter(
                            color: Color(0xFF1A202C),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Have an account?",
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF4A5568),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: " Log In",
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF4EB323),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoute.signInScreen);
                              },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

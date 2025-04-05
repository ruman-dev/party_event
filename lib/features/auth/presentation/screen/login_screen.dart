import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_text_field.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/auth/controller/auth_controller.dart';
import 'package:party_event/features/auth/controller/switch/switch_controller.dart';
import 'package:party_event/features/nav_bar/screen/bottom_nav_bar.dart';

import '../../../../core/helper/from_validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authenticationController = Get.put(AuthController());
  final loginFormKey = GlobalKey<FormState>();

  final SwitchController controller = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '', isTrailingEnabled: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey! Welcome back",
                  style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A202C)),
                ),
                Text(
                  "Sign In to your account",
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF718096)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  textEditingController:
                      authenticationController.logInEmailController,
                  validator: FormValidation.validateEmail,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 25.h,
                  ),
                  prefiesIcnColor: Color(0xFF718096),
                  hintText: "Email",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Color(0xFF718096)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  textEditingController:
                      authenticationController.logInPasswordController,
                  validator: FormValidation.validatePassword,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    size: 25.h,
                  ),
                  prefiesIcnColor: Color(0xFF718096),
                  isPassword: true,
                  hintText: "Password",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Color(0xFF718096)),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                activeColor: Colors.white,
                                activeTrackColor: Color(0xFF4EB323),
                                value: controller.isSwitched.value,
                                onChanged: (value) {
                                  controller.toggleSwitch(value);
                                },
                              ),
                            )),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        "Remember Me",
                        style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF20222C)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.forget);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color(0xFF4EB323)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomBtn(
                    text: "Log In",
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        Get.to(BottomNavBar(isOrganizer: false.obs));
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
                      // Get.toNamed(AppRoute.singnIn);
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
                        text: "Don’t have an Account? ",
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF4A5568),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF4EB323),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoute.singUpScreen);
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/features/nav_bar/screen/bottom_nav_bar.dart';
import '../../../../core/global_widget/custom_btn.dart';
import '../../../../core/routes/app_route.dart';
import '../../controller/onbording_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController onboardingController =
      Get.put(OnboardingController());

  OnboardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          onboardingController.onboardingData[
                                  onboardingController.currentIndex.value]
                              ['image']!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.09 / 0.2,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r),
                            ),
                          ),
                          // clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(24),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                onboardingController.onboardingData[
                                        onboardingController.currentIndex.value]
                                    ['title']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: Color(0xFF1A202C),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                onboardingController.onboardingData[
                                        onboardingController.currentIndex.value]
                                    ['description']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: Color(0xFF718096),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  onboardingController.onboardingData.length,
                                  (i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      height: 4.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: i ==
                                                onboardingController
                                                    .currentIndex.value
                                            ? Color(0xFF337617)
                                            : Color(0xFFD2F3C3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              onboardingController.currentIndex.value == 1
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        children: [
                          CustomBtn(
                            text: "Sign Up",
                            onPressed: () {
                              Get.toNamed(AppRoute.orSignUpScreen);
                            },
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.signInScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      width: 2.w, color: Color(0xFF333333)),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.inter(
                                  color: Color(0xFF333333),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 18.w),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(BottomNavBar(isOrganizer: true.obs));
                                // Get.offNamed(AppRoute.signInScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Skip",
                                style: GoogleFonts.inter(
                                  color: Color(0xFF337617),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomBtn(
                            text: "Next",
                            onPressed: () {
                              print(
                                  "Current Index: ${onboardingController.currentIndex.value}");
                              onboardingController.nextPage();
                            },
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

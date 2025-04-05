import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/option_container.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/auth/presentation/screen/singup_screen.dart';
import 'package:party_event/features/nav_bar/screen/bottom_nav_bar.dart';

import '../../controller/dialog_controller/dialog_controller.dart';

class Organizer extends StatelessWidget {
  Organizer({super.key});

  final DialogController dialogController = Get.put(DialogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Image.asset(
                AssetPath.circle,
                width: 100.w,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Jkeep!",
                    style: GoogleFonts.inter(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A202C),
                    ),
                  ),
                  Text(
                    "Choose Your Role to Begin.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xFF4A5568),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() {
                    return Column(
                      children: [
                        OptionContainer(
                          onTap: () {
                            dialogController.selectIndex(0);
                            debugPrint(dialogController.selectedIndex.value
                                .toString());
                          },
                          title: "Continue with users",
                          imagePath: AssetPath.person,
                          decoracolor: dialogController.selectedIndex.value == 0
                              ? Color(0xFF4EB323)
                              : Color(0xFFFFFFFF),
                          borderColor: dialogController.selectedIndex.value == 0
                              ? Color(0xFF4EB323)
                              : Color(0xFFE2E8F0),
                          imageColor: dialogController.selectedIndex.value == 0
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF1A202C),
                          textColor: dialogController.selectedIndex.value == 0
                              ? Colors.white
                              : Colors.black,
                          icon: dialogController.selectedIndex.value == 0
                              ? Icon(Icons.radio_button_checked)
                              : Icon(Icons.radio_button_off),
                          iconColor: dialogController.selectedIndex.value == 0
                              ? Color(0xFFFFFFFF)
                              : Color(0xFFE2E8F0),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        OptionContainer(
                          onTap: () {
                            dialogController.selectIndex(1);
                            debugPrint(dialogController.selectedIndex.value
                                .toString());
                          },
                          title: "Continue with Organizer",
                          imagePath: AssetPath.person,
                          decoracolor: dialogController.selectedIndex.value == 1
                              ? Color(0xFF4EB323)
                              : Color(0xFFFFFFFF),
                          borderColor: dialogController.selectedIndex.value == 1
                              ? Color(0xFF4EB323)
                              : Color(0xFFE2E8F0),
                          imageColor: dialogController.selectedIndex.value == 1
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF1A202C),
                          textColor: dialogController.selectedIndex.value == 1
                              ? Colors.white
                              : Colors.black,
                          icon: dialogController.selectedIndex.value == 1
                              ? Icon(Icons.radio_button_checked)
                              : Icon(Icons.radio_button_off),
                          iconColor: dialogController.selectedIndex.value == 1
                              ? Color(0xFFFFFFFF)
                              : Color(0xFFE2E8F0),
                        ),
                        SizedBox(
                          height: 280.h,
                        ),
                        CustomBtn(
                            text: "Get Started",
                            onPressed: () {
                              if (dialogController.selectedIndex.value == 0) {
                                Get.toNamed(AppRoute.singUpScreen);
                              } else if (dialogController.selectedIndex.value ==
                                  1) {
                                Get.toNamed(AppRoute.singUpScreen);
                              }
                            })
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

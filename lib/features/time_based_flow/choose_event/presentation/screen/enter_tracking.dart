import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_botton1.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_text_inter.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/search_event/presentation/widgets/custom_text.dart';
import 'package:party_event/features/time_based_flow/choose_event/controller/tracking_controller.dart';

class EnterTracking extends StatelessWidget {
  EnterTracking({super.key});

  final TrackingController controller = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen,
        centerTitle: true,
        title: CustomTextIner(
          text: 'Live countdown',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          size: 20.sp,
        ),
        leading: IconButton(
          icon: Image.asset(AssetPath.backBtn, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                // Green Container
                Container(
                  height: Get.height * 0.23,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff74DB47),
                  ),
                ),
                // Expanded Container for Bottom Section
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.lightGreen,
                              radius: 4.r,
                            ),
                            SizedBox(width: 8.w),
                            CustomTextIner(
                              text: controller.switchBtn.value
                                  ? 'Clocked In'
                                  : 'Clocked Off',
                              color: AppColors.lightGreen,
                              fontWeight: FontWeight.w500,
                              size: 16.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.04),
                        // Expanded Rows for Containers
                        controller.switchBtn.value
                            ? CustomBtn(
                                text: 'Started',
                                onPressed: () {},
                                width: Get.width * 0.3,
                                backgroundColor: Color(0xFFE8F9E1),
                                textColor: AppColors.primaryColor,
                              )
                            : Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: myContainer(
                                            Color(0x99E8F9E1),
                                            'Enter',
                                            '03:24 PM',
                                          ),
                                        ),
                                        SizedBox(width: 30.w),
                                        Expanded(
                                          child: myContainer(
                                            Color(0x1A718096),
                                            'Exit',
                                            '06:48 PM',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: myContainer(Color(0xFFF1F2F5),
                                              'Time Spent', '03:24 Hr'),
                                        ),
                                        SizedBox(width: 30.w),
                                        Expanded(
                                          child: myContainer(Color(0xFFFFE8D8),
                                              'Current Cost', '\$15. USD'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                // Continue Button
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                  child: CustomBtn(text: 'Confirm & Exit', onPressed: () {}),
                ),
              ],
            ),
            // CircleAvatar in the middle of the green and white background
            Positioned(
              top: Get.height * 0.25 - 110.r,
              left: Get.width * 0.5 - 93.r,
              child: CircleAvatar(
                radius: 93.r,
                backgroundColor: Color(0x1FFFFFFF),
                child: CircleAvatar(
                  radius: 82.r,
                  backgroundColor: Color(0x2EFFFFFF),
                  child: CircleAvatar(
                    radius: 70.r,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        controller.switchBtn.value =
                            (!controller.switchBtn.value);
                        controller.toggleBtn(controller.switchBtn);
                      },
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundColor: AppColors.lightGreen,
                        child: Image.asset(
                          controller.switchBtn.value
                              ? AssetPath.pauseIcon
                              : AssetPath.playIcon,
                          width: 24.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Timer Text in the middle position
            Positioned(
              top: Get.height * 0.25 - 110.r + 110.r / 2 - 120.r,
              left: Get.width * 0.5 - 75.w,
              child: CustomTextIner(
                text: '00:03:24',
                color: Colors.white,
                size: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Container Widget
Widget myContainer(Color containerColor, String title, String subTitle) {
  return Container(
    height: Get.height * 0.14,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: containerColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextIner(
          text: title,
          color: Color(0xFF4A5568),
          size: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        CustomTextIner(
          text: subTitle,
          color: AppColors.darkBlueGrey,
          size: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}

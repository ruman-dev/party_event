import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/global_widget/custom_event_card.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetPath.onboardingImgOne,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20.h,
                left: 20.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      SizedBox(width: 255.h),
                      CircleAvatar(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        child: Icon(Icons.favorite_border, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        padding: EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomEventCard(isTimeBasedEvent: false),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30.0,
                          left: 24.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.notificationScreen);
                              },
                              child: Text(
                                'Description',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A202C),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            RichText(
                              text: TextSpan(
                                text:
                                    'Ultricies arcu venenatis in lorem faucibus lobortis at. East odio varius nisl congue aliquam nunc est sit pull convallis magna. Est scelerisque dignissim non nibh.... ',
                                style: GoogleFonts.inter(
                                    fontSize: 12.sp, color: Color(0xFF4A5568)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Read More',
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
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
                  // ),
                  // ),
                ),
                // ],
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: CustomBtn(
              text: "Buy Ticket",
              // width: 300.w,
              onPressed: () {
                debugPrint("print");
                Get.toNamed(AppRoute.ticketScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}

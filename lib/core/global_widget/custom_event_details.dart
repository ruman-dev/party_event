import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_event_card.dart';
import '../routes/app_route.dart';
import '../utils/app_colors.dart';
import '../utils/asset_path.dart';

class CustomEventDetails extends StatelessWidget {
  const CustomEventDetails({
    super.key,
    required this.isTimeBasedEvent,
  });

  final bool isTimeBasedEvent;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.05, horizontal: Get.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              // SizedBox(width: Get.width * 0.8),
              CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
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
                  height: Get.height * 0.28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CustomEventCard(isTimeBasedEvent: isTimeBasedEvent),
                      // SizedBox(height: 10.h),
                    ],
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
          ),
        ),
      ],
    );
  }
}

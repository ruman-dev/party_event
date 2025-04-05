import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';
import '../../../home/widgets/popular_event_card.dart';

class Mylistings extends StatelessWidget {
  const Mylistings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Color(0xFFFAFAFA),
        backgroundColor: Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AssetPath.profileImg),
                ),
                Positioned(
                  bottom: 0.w,
                  right: 0.w,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Active status color
                      border: Border.all(
                        color: Colors.white,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Welcome',
                    style: GoogleFonts.inter(
                        fontSize: 10.sp, color: AppColors.secondaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'MD Rafi Islam',
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Keeps AppBar balanced
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoute.notificationScreen);
              },
              child: Stack(
                children: [
                  Image.asset(
                    AssetPath.notificationIcon,
                    height: 18.h,
                    width: 16.w,
                  ),
                  Positioned(
                    top: 0.w,
                    right: 0.w,
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My Listings',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return PopularEventCard(
                        height: 80.h,
                        weight: 80.w,
                        isMargin: false.obs,
                        isTrailingIcon: false.obs,
                        isOrganizer: true.obs,
                        padding: 0.w,
                      );
                    }),
              ),
              SizedBox(height: 16.h),
              CustomBtn(
                  text: "Create Event",
                  onPressed: () {
                    Get.toNamed(AppRoute.createEvent);
                  }),
              SizedBox(height: 10.h),
            ]),
      ),
    );
  }
}

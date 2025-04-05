import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_searchbar.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/home/widgets/popular_event_card.dart';
import 'package:party_event/features/time_based_flow/choose_event/presentation/screen/choose_event_screen.dart';

import '../../../core/global_widget/custom_featured_card.dart';
import '../../../core/utils/app_colors.dart';
import '../../event_details/screen/home_event_screen.dart';
import '../widgets/time_based_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQueryNotifier = ValueNotifier<String>('');

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
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
                        color:
                            AppColors.primaryColor, // Active notification color
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.searchEventScreen);
                        },
                        child: CustomSearchBar(
                          isEnabled: false,
                          isHomeColor: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // margin: EdgeInsets.only(right: 16.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: AppColors.borderColor, width: 1.w),
                        ),
                        child: Image.asset(
                          AssetPath.filterImg,
                          height: 44.h,
                          width: 44.w,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Featured 🔥',
                      style: GoogleFonts.inter(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () =>
                            Get.toNamed(AppRoute.allFeaturedScreen),
                        child: Text(
                          'View All',
                          style: GoogleFonts.inter(
                              fontSize: 10.sp, color: AppColors.primaryColor),
                        ))
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => HomeEventScreen(isTimeBasedEvent: false));
                      },
                      child: Row(
                        children: [
                          CustomFeaturedCard(),
                          CustomFeaturedCard(),
                        ],
                      )),
                ),
                // SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Events',
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.popularEventScreen);
                      },
                      child: Text(
                        'View more',
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Column(
                  children: [
                    PopularEventCard(
                      isMargin: false.obs,
                      isTrailingIcon: false.obs,
                      isOrganizer: false.obs,
                    ),
                    SizedBox(height: 16.h),
                    PopularEventCard(
                      isMargin: false.obs,
                      isTrailingIcon: false.obs,
                      isOrganizer: false.obs,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'Time-based Event',
                      style: GoogleFonts.inter(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(ChooseEventScreen());
                      },
                      child: Text(
                        'View more',
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TimeBasedCard(),
                      SizedBox(width: 10.w),
                      TimeBasedCard(),
                      SizedBox(width: 10.w),
                      TimeBasedCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

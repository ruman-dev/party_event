import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';
import '../../../core/global_widget/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isNew = false.obs;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notification Event',
        isTrailingEnabled: true,
        iconPath: AssetPath.closeIcon,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: AppColors.lightPrimaryColor),
                        child: Image.asset(
                          AssetPath.calendarIconFill,
                          width: 18.w,
                          height: 20.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Successful!',
                            style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGrey),
                          ),
                          SizedBox(height: 5.h),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  '20 Dec, 2022',
                                  style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.secondaryColor),
                                ),
                                VerticalDivider(
                                  color: AppColors.darkGrey,
                                  thickness: 1,
                                  width: 20.w,
                                ),
                                Text(
                                  '20:49 PM',
                                  style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.secondaryColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      isNew == false
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.primaryColor),
                                child: Text(
                                  'New',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'You have successfully booked the Art Workshops. The event will be held on Sunday, December 22, 2022, 13.00 - 14.00 PM. Don\'t forget to activate your reminder. Enjoy the event!',
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor),
                  ),
                  SizedBox(height: 24.h),
                ],
              );
            }),
      )),
    );
  }
}

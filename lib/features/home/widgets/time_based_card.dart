import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/event_details/screen/home_event_screen.dart';

class TimeBasedCard extends StatelessWidget {
  const TimeBasedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetPath.timeBasedImg1, width: 139.w, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            'Disco - Party 2024',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey),
          ),
          SizedBox(height: 5.h),
          Text(
            '   Pay 10% upfront + \$0.30\n per minute',
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: 10.sp,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrey),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 139.sp,
            height: 32.h,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.sp)),
            child: TextButton(
              onPressed: () {
                Get.to(() => HomeEventScreen(isTimeBasedEvent: true));
              },
              child: Text(
                'View Details',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/asset_path.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({
    super.key,
    required this.isTimeBasedEvent,
  });

  final bool isTimeBasedEvent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shere Bangla Concert",
              style: GoogleFonts.inter(
                  fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              "\$96 USD",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: isTimeBasedEvent
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: isTimeBasedEvent
                      ? AppColors.primaryColor
                      : AppColors.orangeColor,
                  size: 12.r,
                ),
                SizedBox(width: 4.w),
                Text(
                  "ABC Avenue, USA",
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5568),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Row(
              children: [
                Image.asset(
                  AssetPath.calendarIconFill,
                  height: 12.h,
                  width: 12.w,
                  color: isTimeBasedEvent
                      ? AppColors.primaryColor
                      : AppColors.orangeColor,
                ),
                SizedBox(width: 6.w),
                Text(
                  "25-27 October, 22",
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5568),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12.h),
        // Members Joined
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isTimeBasedEvent
                ? Text(
                    '10% upfront + \$0.30 per minute',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryColor,
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        "15.7k+ ",
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A202C),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "Members are joined:",
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A202C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.grey.withValues(alpha: 0.1),
                                  backgroundImage:
                                      AssetImage(AssetPath.personOne),
                                  radius: 14.r,
                                ),
                                buildAvatar(AssetPath.personTwo, 22.w),
                                buildAvatar(AssetPath.personOne, 44.w),
                                buildAvatar(AssetPath.personTwo, 66.w),
                                Positioned(
                                  left: 88.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2.w),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 12.r,
                                      child: Text(
                                        '5k+',
                                        style: GoogleFonts.inter(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            Text(
              "View All",
              style: GoogleFonts.inter(
                color: AppColors.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AssetPath.userOne),
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
                      'Tamim Ikram',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A202C),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Event Organiser',
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        color: Color(0xFF1A202C),
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFE8F9E1)),
                    child: Image.asset(
                      AssetPath.smsIcon,
                      width: 15.w,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFE8F9E1)),
                    child: Image.asset(
                      AssetPath.phoneIcon,
                      width: 15.w,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildAvatar(String image, double left) {
  return Positioned(
    left: left,
    child: CircleAvatar(
      backgroundColor: Colors.grey.withValues(alpha: 0.1),
      backgroundImage: AssetImage(image),
      radius: 14.r,
    ),
  );
}

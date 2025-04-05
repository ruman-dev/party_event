import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/utils/app_colors.dart';

import '../utils/asset_path.dart';

class CustomFeaturedCard extends StatelessWidget {
  const CustomFeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w, bottom: 15.h),
      padding: EdgeInsets.all(5.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  AssetPath.featuredImgOne,
                  width: 241.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20.w,
                right: 20.w,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              'International Band Music Co..',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.calendarIcon,
                  width: 10.w,
                  height: 12.h,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 5.w),
                Text(
                  '12-15 October, 22',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.inter(
                      fontSize: 10.sp, color: AppColors.secondaryColor),
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.location_on,
                  size: 12.sp,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 5.w),
                Text(
                  'ABC Avenue, USA',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.inter(
                      fontSize: 10.sp, color: AppColors.secondaryColor),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withValues(alpha: 0.1),
                      backgroundImage: AssetImage(AssetPath.personOne),
                      radius: 16.r,
                    ),
                    Positioned(
                      left: 22.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withValues(alpha: 0.1),
                        backgroundImage: AssetImage(AssetPath.personTwo),
                        radius: 16.r,
                      ),
                    ),
                    Positioned(
                      left: 44.w,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.w),
                          color: AppColors.primaryColor,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 14.r,
                          child: Text(
                            '5k+',
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 48.w),
                Text(
                  'Members joined',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(width: 8.w),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  ),
                  child: Text(
                    'Join Now',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

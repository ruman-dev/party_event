import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/utils/app_colors.dart';

import '../../../core/global_widget/custom_appbar.dart';
import '../../../core/utils/asset_path.dart';

class AllFeaturedScreen extends StatelessWidget {
  AllFeaturedScreen({super.key});

  List<String> featuredImgList = [
    AssetPath.featuredParty2,
    AssetPath.featuredParty6,
    AssetPath.featuredParty3,
    AssetPath.featuredParty4,
    AssetPath.featuredParty2,
    AssetPath.featuredParty5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'All Featured',
          isTrailingEnabled: false,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.w,
                childAspectRatio: 0.6.r,
              ),
              itemCount: featuredImgList.length,
              itemBuilder: (context, index) {
                return Container(
                    // margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          children: [
                            Image.asset(
                              featuredImgList[index],
                              width: 138.w,
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'International Co...',
                                  softWrap: true,
                                  style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkGrey),
                                ),
                                Text(
                                  '03 Oct, 22 • 19.00 - 23.00',
                                  style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        AssetPath.locationIcon,
                                        width: 11.33.w,
                                        height: 13.33.h,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text('Florida, USA',
                                          style: GoogleFonts.inter(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                  ),
                                  Image.asset(AssetPath.favouriteIcon),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              }),
        ));
  }
}

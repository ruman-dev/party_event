import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';

import '../../../core/global_widget/custom_event_card.dart';

class PopularEventCard extends StatelessWidget {
  final RxBool isMargin;
  final RxBool isTrailingIcon;
  final RxBool isOrganizer;
  final double? height;
  final double? weight;
  final double? padding;

  const PopularEventCard({
    super.key,
    required this.isMargin,
    required this.isTrailingIcon,
    required this.isOrganizer,
    this.height,
    this.weight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 10.w),
      margin: isMargin.value
          ? EdgeInsets.symmetric(vertical: 7.h, horizontal: 16.h)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: height ?? 70.h,
                width: weight ?? 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  AssetPath.popularParty1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Disco - Party 2024',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '03 October, 22',
                            style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGrey),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.circle,
                            size: 4.sp,
                            color: AppColors.orangeColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Florida, USA',
                            style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGrey),
                          ),
                        ],
                      ),

                      ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> added User >>>>>>>>>>>>>>>>>>>>>>>///

                      SizedBox(
                        height: 10.h,
                      ),

                      Obx(
                        () => isOrganizer.value == true
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                        "Joined:",
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
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.1),
                                                  backgroundImage: AssetImage(
                                                      AssetPath.personOne),
                                                  radius: 14.r,
                                                ),
                                                buildAvatar(
                                                    AssetPath.personTwo, 11.w),
                                                buildAvatar(
                                                    AssetPath.personOne, 22.w),
                                                buildAvatar(
                                                    AssetPath.personTwo, 33.w),
                                                Positioned(
                                                  left: 44.w,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2.w),
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      radius: 12.r,
                                                      child: Text(
                                                        '5k+',
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              !isTrailingIcon.value
                  ? Row(
                      children: [
                        VerticalDivider(
                          color:
                              AppColors.secondaryColor.withValues(alpha: 0.5),
                          thickness: 1.5.w,
                          indent: 20,
                          endIndent: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\$10. USD',
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'JOIN NOW',
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            /// >>>>>>>>>>>>>>>>>>>> added view details <<<<<<<<<<<<<<<<<<<<<///

                            Obx(
                              () => isOrganizer.value == true
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoute.evenDetails);
                                        // print('Gone');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: Color(0xFFD2F3C3)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "View Details",
                                              style: GoogleFonts.inter(
                                                fontSize: 10.sp,
                                                color: Color(0xFF337617),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

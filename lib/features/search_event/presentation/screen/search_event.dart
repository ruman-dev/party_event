import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/features/home/widgets/popular_event_card.dart';
import 'package:party_event/features/search_event/presentation/widgets/custom_text.dart';
import 'package:party_event/features/search_event/presentation/widgets/custom_textformfield.dart';
import 'package:party_event/features/search_event/presentation/widgets/filter_items.dart';

import '../../../../core/global_widget/custom_searchbar.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';

class SearchEvent extends StatelessWidget {
  List<String> time = [
    'Today',
    'Tomorrow',
    'This Week',
  ];

  RxInt selectedTimeItem = 0.obs;

  SearchEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Event',
        isTrailingEnabled: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.searchEventScreen);
                    },
                    child: CustomSearchBar(
                      isEnabled: true,
                      isHomeColor: false,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          enableDrag: true,
                          isDismissible: true,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FilterItems(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                        top: 12.w,
                                      ),
                                      child: Text(
                                        'Time and Date',
                                        style: GoogleFonts.inter(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkBlueGrey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        spacing: 30.w,
                                        children: [
                                          ...time.map(
                                            (e) => Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  selectedTimeItem.value =
                                                      time.indexOf(e) + 1;

                                                  if (selectedTimeItem.value ==
                                                      0) {
                                                    Get.snackbar('Select Time',
                                                        'Please select a time to show!',
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM);
                                                  }
                                                },
                                                child: Obx(
                                                  () => Container(
                                                    height: 42.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16.w),
                                                    decoration: BoxDecoration(
                                                      color: selectedTimeItem
                                                                  .value ==
                                                              time.indexOf(e) +
                                                                  1
                                                          ? AppColors
                                                              .primaryColor
                                                          : Color(0xFFF6F6F6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        e,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts.inter(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTimeItem
                                                                        .value ==
                                                                    time.indexOf(
                                                                            e) +
                                                                        1
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF4A5568)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: CustomTextFormField(
                                        title: 'Choose from calendar',
                                        trailingIcon:
                                            AssetPath.calendarIconFill,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                        top: 12.w,
                                      ),
                                      child: TextButton(
                                        child: Text(
                                          'Location',
                                          style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkBlueGrey,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed(AppRoute.mapScreen);
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 16.w),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: CustomTextFormField(
                                        title: 'New York, USA',
                                        trailingIcon: AssetPath.locationIcon,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            title: 'Price Range',
                                          ),
                                          CustomText(
                                            title: '\$20-\$120',
                                            textColor: AppColors.orangeColor,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Chart Here

                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CustomBtn(
                                              text: 'Reset',
                                              onPressed: () {},
                                              textColor: AppColors.primaryColor,
                                              backgroundColor:
                                                  Color(0xFFD2F3C3),
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                          Expanded(
                                            child: CustomBtn(
                                              text: 'Apply',
                                              onPressed: () {
                                                // onPressed on Apply Button
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      // margin: EdgeInsets.only(right: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PopularEventCard(
                    isMargin: true.obs,
                    isTrailingIcon: false.obs,
                    isOrganizer: false.obs,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class RangeData {
  final String x;
  final double low;
  final double high;

  RangeData(this.x, this.low, this.high);
}

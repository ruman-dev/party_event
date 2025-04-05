import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';

class FilterItems extends StatelessWidget {
  FilterItems({super.key});

  final List<String> filterItem = [
    'All',
    'Design',
    'Music',
    'Sports',
  ];
  final List<String> filterImg = [
    AssetPath.circle,
    AssetPath.designIcon,
    AssetPath.paintIcon,
    AssetPath.sportIcon,
  ];
  RxList<int> selectedItems = <int>[].obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10.h),
        Container(
          height: 4.h,
          width: 42.w,
          decoration: BoxDecoration(
            color: Color(0x33718096),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Filter Events',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlueGrey,
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          width: double.infinity,
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: filterItem.length,
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    if (selectedItems.contains(index)) {
                      selectedItems.remove(index);
                    } else {
                      selectedItems.add(index);
                    }
                    print(selectedItems);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: selectedItems.contains(index)
                          ? AppColors.primaryColor
                          : Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(30.r),
                      // border: Border.all(color: AppColors.borderColor, width: 1.w),
                    ),
                    child: Row(
                      children: [
                        filterItem[index] != 'All'
                            ? Container(
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    backgroundImage: AssetImage(
                                      filterImg[index],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(width: 5.w),
                        Text(
                          filterItem[index],
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedItems.contains(index)
                                ? Colors.white
                                : Color(0xFF718096),
                          ),
                        ),
                        SizedBox(width: 5.w),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

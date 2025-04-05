import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/organizer/controller/calendar_controller.dart';

import '../../../../core/global_widget/cuntry_selection.dart';
import '../../../../core/global_widget/custom_textFiled1.dart';
import '../../../../core/global_widget/dropdown_button.dart';
import '../../../../core/global_widget/selectItem.dart';

class OrganizerDeatails extends StatelessWidget {
  OrganizerDeatails({super.key});

  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: "Profile", centerTitle: false, isTrailingEnabled: false),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Image.asset(
                  AssetPath.org,
                  width: 140.w,
                ),
              ),
              Positioned(
                left: Get.width * 0.57,
                top: Get.height * 0.1,
                child: ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AssetPath.edit1,
                    height: 24.h,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField1(
                    contentPadding: EdgeInsets.all(18.r),
                    hintText: "Andrew Ainsley",
                    hintStyle: GoogleFonts.inter(
                        color: AppColors.darkBlueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                    fillColor: Colors.white,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField1(
                    contentPadding: EdgeInsets.all(18.r),
                    hintText: "Andrew",
                    hintStyle: GoogleFonts.inter(
                        color: AppColors.darkBlueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                    fillColor: Colors.white,
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => CustomTextField1(
                      contentPadding: EdgeInsets.all(18.r),
                      hintText: calendarController.formattedDate(),
                      hintStyle: GoogleFonts.inter(
                          color: AppColors.darkBlueGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                      fillColor: Colors.white,
                      isEnabled: false,
                      readOnly: false,
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        child: Image.asset(
                          AssetPath.calendarIconFill,
                          width: 18.w,
                        ),
                      ),
                      containerClick: () {
                        calendarController.selectDate(context);
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    textStyle: GoogleFonts.inter(
                      color: Color(0xFF1A202C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                    star: false.obs,
                    image: Image.asset(AssetPath.dropDown),
                    // hintText: "Event Price",
                    selectedValue: Status.selectedValue1,
                    items: Status.items1,
                    onChanged: Status().onChanged,
                    showLabel: true.obs,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField1(
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset(
                        AssetPath.gmail,
                        width: 25.w,
                      ),
                    ),
                    hintText: "andrew_ainsley@yourdomain.com",
                    hintStyle: GoogleFonts.inter(
                        color: AppColors.darkBlueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                    fillColor: Colors.white,
                  ),
                  SizedBox(height: 16.h),
                  CountrySelectionContainer(),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomDropdownButton(
                    star: false.obs,
                    image: Image.asset(AssetPath.dropDown),
                    hintText: "Event Price",
                    selectedValue: CountryName.selectedValue1,
                    items: CountryName.items1,
                    onChanged: CountryName().onChanged,
                    showLabel: true.obs,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

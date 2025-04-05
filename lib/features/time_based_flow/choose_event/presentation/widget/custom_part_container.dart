import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_text_inter.dart';
import 'package:party_event/core/utils/asset_path.dart';

import '../screen/enter_tracking.dart';

class CustomPartContainer extends StatelessWidget {
  const CustomPartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(AssetPath.featuredImgOne),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextIner(
            text: "International Band Music Co....",
            size: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Image.asset(
                AssetPath.calendar,
                width: 15.w,
                height: 15.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomTextIner(
                text: "10 AM-06PM, 12 Nov 2024",
                fontWeight: FontWeight.w400,
                size: 12.sp,
                color: Colors.black,
              ),
              SizedBox(
                width: 5.w,
              ),
              Image.asset(
                AssetPath.location,
                width: 15.w,
                height: 15.h,
              ),
              CustomTextIner(
                text: "ABC Avenue, USA",
                fontWeight: FontWeight.w400,
                size: 12.sp,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextIner(
                text: "10% Upfront + \$0.30 Per Minute",
                fontWeight: FontWeight.w400,
                size: 12.sp,
                color: Colors.black,
              ),
              CustomTextIner(
                text: "\$10.USD",
                fontWeight: FontWeight.w600,
                size: 14.sp,
                color: Color(0xff4EB323),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomBtn(
              text: "Book Now",
              onPressed: () {
                Get.to(EnterTracking());
              }),
        ],
      ),
    );
  }
}

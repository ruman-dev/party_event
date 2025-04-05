import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../utils/app_colors.dart';
import '../utils/asset_path.dart';

class CustomPdfScreen extends StatelessWidget {
  const CustomPdfScreen({
    super.key,
    required this.eventDate,
    required this.eventTime,
    required this.eventVenue,
    required this.eventSeatOrCost,
    required this.eventBarCode,
    required this.eventTitle,
    required this.isTimeBasedEvent,
  });

  final bool isTimeBasedEvent;
  final String eventTitle;
  final String eventDate;
  final String eventTime;
  final String eventVenue;
  final String eventSeatOrCost;
  final String eventBarCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            height: 518.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                        height: 168.h,
                        width: 287.w,
                        decoration: BoxDecoration(
                          // color: AppColors.whiteColor,
                          border: Border.all(
                              color: Colors.grey.shade400, width: 4.w),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Image.asset(
                          AssetPath.ticketImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 257.w,
                        height: 288.h,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              Text(
                                eventTitle,
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkBlueGrey,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              DottedLine(
                                dashColor: Color(0xFFE2E8F0),
                                dashLength: 8.h,
                                dashGapLength: 8.h,
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date',
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        eventDate,
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          color: Color(0xFF4A5568),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'Venue',
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        eventVenue,
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          color: Color(0xFF4A5568),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        isTimeBasedEvent
                                            ? 'Time'
                                            : 'Time Spent',
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        eventTime,
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          color: Color(0xFF4A5568),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        isTimeBasedEvent
                                            ? 'Total Cost'
                                            : 'Seat Count',
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        eventSeatOrCost,
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          color: Color(0xFF4A5568),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 16.h),
                              DottedLine(
                                dashColor: Color(0xFFE2E8F0),
                                dashLength: 8.h,
                                dashGapLength: 8.h,
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                height: 39.h,
                                width: double.infinity,
                                child: SfBarcodeGenerator(
                                  value: eventBarCode,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: Get.width * 0,
                  bottom: Get.width * 0.245,
                  child: Icon(
                    Icons.circle,
                    color: AppColors.primaryColor,
                    size: 30.r,
                  ),
                ),
                Positioned(
                    right: Get.width * 0,
                    bottom: Get.width * 0.245,
                    child: Icon(
                      Icons.circle,
                      color: AppColors.primaryColor,
                      size: 30.r,
                    ))
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            // width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Download Ticket',
                    style: GoogleFonts.inter(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 17.w,
                    child: Image.asset(
                      AssetPath.downloadIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

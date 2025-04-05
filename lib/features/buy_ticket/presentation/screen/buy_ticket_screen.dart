import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/app_colors.dart';

import '../../../../core/global_widget/custom_btn.dart';

class BuyTicketScreen extends StatelessWidget {
  BuyTicketScreen({super.key});

  RxInt seatCount = 1.obs;
  RxString selectTicketType = ''.obs;
  List<String> ticketType = ['VIP', 'Economy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ticket',
        isTrailingEnabled: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.w),
            child: Text(
              'Ticket Type',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlueGrey,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: CustomBtn(
                      text: ticketType[0],
                      onPressed: () {
                        selectTicketType.value = ticketType[0];
                        debugPrint(selectTicketType.value);
                      },
                      textColor: selectTicketType.value == ticketType[0]
                          ? Colors.white
                          : Color(0xFF337617),
                      backgroundColor: selectTicketType.value == ticketType[0]
                          ? AppColors.primaryColor
                          : Color(0xFFD2F3C3),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: CustomBtn(
                      text: ticketType[1],
                      textFontWeight: FontWeight.w400,
                      textColor: selectTicketType.value == ticketType[1]
                          ? Colors.white
                          : Color(0xFF337617),
                      onPressed: () {
                        selectTicketType.value = ticketType[1];
                        debugPrint(selectTicketType.value);
                      },
                      backgroundColor: selectTicketType.value == ticketType[1]
                          ? AppColors.primaryColor
                          : Color(0xFFD2F3C3),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.w),
            child: Text(
              'Seat',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlueGrey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Color(0xFFE2E8F0),
                  ),
                  borderRadius: BorderRadius.circular(16.r)),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    if (seatCount.value > 1) {
                      seatCount.value--;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                title: Obx(
                  () => Text(
                    seatCount.value.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlueGrey,
                    ),
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    if (seatCount.value > 0) {
                      seatCount.value++;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.w),
            child: Text(
              'Ticket Price',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlueGrey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, top: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VIP Ticket',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  '\$50 USD',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, top: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  '5 x \$50 USD',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Divider(
              thickness: 1,
              color: Color(0xFFE2E8F0),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBlueGrey,
                  ),
                ),
                Text(
                  '\$250 USD',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBlueGrey,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: CustomBtn(
                text: 'Continue',
                onPressed: () {
                  // debugPrint('Selected Ticket Type: ${selectTicketType.value}\nSelected Seat: ${seatCount.value}');
                  Get.toNamed(AppRoute.selectPaymentMethodScreen);
                }),
          ),
          // SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

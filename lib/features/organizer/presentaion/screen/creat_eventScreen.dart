import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_textFiled1.dart';

import '../../../../core/global_widget/dropdown_button.dart';
import '../../../../core/global_widget/selectItem.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';
import '../../controller/calendar_controller.dart';

class CreatEventscreen extends StatelessWidget {
  CreatEventscreen({super.key});

  final CalendarController calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create New Event", isTrailingEnabled: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                      image: AssetImage(
                        AssetPath.createEvent,
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 25),
                      child: Image.asset(
                        AssetPath.edite,
                        width: 20.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 250.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            AssetPath.createEvent1,
                            width: 70.w,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: DottedBorder(
                      color: Color(0xFF74DB47),
                      strokeWidth: 2,
                      dashPattern: [6, 4],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12.r),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.r),
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Event Details",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF20222C),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Event Name",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField1(
                hintText: "International Band Music Concert",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Event Type",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdownButton(
                star: false.obs,
                image: Image.asset(AssetPath.dropDown),
                hintText: "Music",
                selectedValue: EventType.eventType,
                items: EventType.eventType1,
                onChanged: EventType().onChanged,
                showLabel: true.obs,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Total VIP Seat",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField1(
                hintText: "50",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "VIP Seat Price",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField1(
                hintText: "\$96",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "total EconomySeat",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField1(
                hintText: "90",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Economy Seat Price",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField1(
                hintText: "\$56",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Event Location",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdownButton(
                star: false.obs,
                image: Image.asset(
                  AssetPath.location,
                ),
                selectedValue: EventLocation.selectedValue1,
                items: EventLocation.items1,
                onChanged: EventLocation().onChanged,
                showLabel: true.obs,
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Select Date and Time",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A202C),
                  ),
                ),
                TextSpan(
                  text: "*",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4EB323),
                  ),
                )
              ])),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => CustomTextField1(
                  hintText: calendarController.formattedDate(),
                  hintStyle: GoogleFonts.inter(
                      color: AppColors.darkBlueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                  fillColor: Colors.white,
                  isEnabled: false,
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Image.asset(
                      AssetPath.calendarIconFill,
                      width: 10.w,
                    ),
                  ),
                  containerClick: () {
                    calendarController.selectDate(context);
                    print(calendarController.formattedDate());
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Event Location",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A202C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField1(
                maxLines: 3,
                hintText:
                    "Venenatis in lorem faucibus lobortis at. East odio\n varius nisl congue aliquam nunc est sit pull\n convallis magna. Est scelerisque dignissim non nib",
                hintStyle: GoogleFonts.inter(
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomBtn(text: "Save Changes", onPressed: () {}),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

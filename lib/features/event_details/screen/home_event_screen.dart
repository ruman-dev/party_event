import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_event_details.dart';
import 'package:party_event/core/routes/app_route.dart';

class HomeEventScreen extends StatelessWidget {
  const HomeEventScreen({super.key, required this.isTimeBasedEvent});

  final bool isTimeBasedEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomEventDetails(isTimeBasedEvent: isTimeBasedEvent),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: CustomBtn(
              text: "Buy Ticket",
              // width: 300.w,
              onPressed: () {
                // debugPrint("print");
                Get.toNamed(AppRoute.ticketScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}

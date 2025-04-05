import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';

import '../../../../core/global_widget/custom_btn.dart';
import '../../../../core/global_widget/custom_event_details.dart';
import '../../../../core/routes/app_route.dart';

class TimeEventDetails extends StatelessWidget {
  const TimeEventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomEventDetails(isTimeBasedEvent: false),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: CustomBtn(
              text: "Buy Ticket",
              // width: 300.w,
              onPressed: () {
                debugPrint("print");
                Get.toNamed(AppRoute.selectPaymentMethodScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}

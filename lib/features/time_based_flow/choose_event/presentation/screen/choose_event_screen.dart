import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/features/time_based_flow/choose_event/presentation/widget/custom_part_container.dart';

class ChooseEventScreen extends StatelessWidget {
  const ChooseEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppBar(title: 'Choose Your Event', isTrailingEnabled: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomPartContainer();
                  },
                )
              ],
            ),
          ),
        ));
  }
}

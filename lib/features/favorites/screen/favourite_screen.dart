import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/features/home/widgets/popular_event_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favorites', isTrailingEnabled: false),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
              child: PopularEventCard(
                isMargin: false.obs,
                isTrailingIcon: true.obs,
                isOrganizer: false.obs,
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_event/features/home/widgets/popular_event_card.dart';

import '../../../core/global_widget/custom_appbar.dart';

class PopularEventScreen extends StatelessWidget {
  const PopularEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isTrailingEnabled: false,
        title: 'Popular Event',
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return PopularEventCard(
              isMargin: true.obs,
              isTrailingIcon: false.obs,
              isOrganizer: false.obs,
            );
          }),
    );
  }
}

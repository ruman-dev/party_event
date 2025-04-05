import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/core/global_widget/custom_searchbar.dart';
import 'package:party_event/features/profile/presentation/widget/select_option.dart';
import '../../../../core/utils/asset_path.dart';

class SelectLanguage extends StatelessWidget {
  SelectLanguage({super.key});

  final RxInt selectedItem = 0.obs;

  final RxList<Map<String, dynamic>> proFile = <Map<String, dynamic>>[
    {
      'image': AssetPath.usa,
      'title': 'English',
    },
    {
      'image': AssetPath.german,
      'title': 'German',
    },
    {
      'image': AssetPath.poland,
      'title': 'Polish',
    },
    {
      'image': AssetPath.french,
      'title': 'French',
    },
    {
      'image': AssetPath.china,
      'title': 'China',
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Language', isTrailingEnabled: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomSearchBar(isEnabled: true, isHomeColor: false, height: 50.h),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: proFile.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Options(
                        imagePath: proFile[index]['image'],
                        option: proFile[index]['title'],
                        onPressed: () {
                          selectedItem.value = index;
                          debugPrint(
                              "Selected language: ${proFile[index]['title']}");
                        },
                        isSelected: selectedItem.value == index,
                        isPaymentScreen: false,
                        isTrailingEnabled: true,
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: CustomBtn(
                  text: 'Save Change',
                  onPressed: () {
                    // debugPrint('Selected Ticket Type: ${selectTicketType.value}\nSelected Seat: ${seatCount.value}');
                    // Get.toNamed(AppRoute.generateTicketScreen);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../features/organizer/controller/ountry_controller.dart';

class CountrySelectionContainer extends StatelessWidget {
  final CountryController countryController = Get.put(CountryController());

  CountrySelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: Color(0xFFE2E8F0)),
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GetBuilder<CountryController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedCountry.value.isNotEmpty
                      ? controller.selectedCountry.value
                      : null,
                  icon: SizedBox(),
                  items: controller.countries.map((country) {
                    return DropdownMenuItem(
                      value: country['name'],
                      // value: country['phone'],
                      child: Row(
                        children: [
                          Text(
                            country['flag']!,
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.keyboard_arrow_down),
                          Text(
                            country['name']!,
                            // country['phone']!,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2D2D2D)),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.updateSelectedCountry(value);
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';

class Faqs extends StatelessWidget {
  Faqs({super.key});

  final RxList<bool> _isExpandedList = List.generate(3, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FAQs', isTrailingEnabled: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          itemCount: _isExpandedList.length,
          itemBuilder: (context, index) {
            return Obx(() => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xFFF9F9FB),
                          border: Border.all(color: Colors.transparent)),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide.none,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide.none,
                        ),
                        title: Padding(
                          padding: EdgeInsets.all(18.0.r),
                          child: Text(
                            index == 0
                                ? 'How To use booking system'
                                : 'You want your order into your home?',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF1A202C),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        initiallyExpanded: _isExpandedList[index],
                        onExpansionChanged: (bool expanded) {
                          _isExpandedList[index] = expanded;
                        },
                        trailing: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2.w, color: Color(0xFF4EB323)),
                            ),
                            child: Icon(
                              _isExpandedList[index] ? Icons.remove : Icons.add,
                              color: Color(0xFF4EB323),
                            ),
                          ),
                        ),
                        children: [
                          Divider(
                            indent: 17,
                            thickness: 1.5,
                            color: Color(0x33718096),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Color(0xFF718096),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ));
          },
        ),
      ),
    );
  }
}

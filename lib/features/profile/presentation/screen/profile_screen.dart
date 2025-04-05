import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/asset_path.dart';
import 'package:party_event/features/notifications/screen/notification_screen.dart';

import '../../../../core/global_widget/dialog.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, dynamic>> proFile = [
    {
      'image': AssetPath.notification,
      'title': 'Notifications',
      'icon': Icons.arrow_forward_ios_rounded
    },
    {
      'image': AssetPath.editProfile,
      'title': 'Edit profile',
      'icon': Icons.arrow_forward_ios_rounded
    },
    {
      'image': AssetPath.language,
      'title': 'Language',
      'icon': Icons.arrow_forward_ios_rounded,
    },
    {
      'image': AssetPath.faq,
      'title': 'FAQ',
    },
    {
      'image': AssetPath.logout,
      'title': 'Logout',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Profile', isTrailingEnabled: false, centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(
              AssetPath.org,
              height: 120.h,
            ),
            Text(
              "Adam John Levine",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Color(0xFF2D2D2D),
              ),
            ),
            Text(
              "Levineadame@mail.com",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Color(0xFF2D2D2D),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(
              thickness: 1.5,
              height: 1.h,
              color: Color(0xFFEDF2F7),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: proFile.length,
                itemBuilder: (context, index) {
                  bool isLogout = proFile[index]['isLogout'] ?? false;
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => NotificationScreen());
                      } else if (index == 1) {
                        Get.toNamed(AppRoute.userDetails);
                      } else if (index == 2) {
                        Get.toNamed(AppRoute.selectLanguage);
                      } else if (index == 3) {
                        Get.toNamed(AppRoute.faqs);
                      } else if (index == 4) {
                        showModalBottomSheet(
                          context: context,
                          // isScrollControlled: true,
                          isDismissible: true,
                          enableDrag: true,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return ShowDialog4();
                          },
                        );
                      }
                    },
                    child: ListTile(
                      leading: Image.asset(
                        proFile[index]['image'],
                        height: 30.h,
                      ),
                      title: Text(
                        proFile[index]['title'],
                        style: GoogleFonts.inter(
                          fontWeight:
                              isLogout ? FontWeight.w500 : FontWeight.w400,
                          fontSize: 16.sp,
                          color: isLogout ? Colors.red : Color(0xFF2D2D2D),
                        ),
                      ),
                      trailing: proFile[index]['icon'] != null
                          ? Icon(proFile[index]['icon'])
                          : SizedBox(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    // thickness: 0.0,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_appbar.dart';
import 'package:party_event/core/routes/app_route.dart';
import 'package:party_event/core/utils/app_colors.dart';
import 'package:party_event/core/utils/asset_path.dart';

import '../../../../core/global_widget/dialog.dart';

class Organizerprofile extends StatelessWidget {
  Organizerprofile({super.key});

  final List<Map<String, dynamic>> proFile = [
    {
      'image': AssetPath.editProfile,
      'title': 'Profile',
      'icon': Icons.arrow_forward_ios_rounded
    },
    {
      'image': AssetPath.wallet,
      'title': 'Payments',
      'icon': Icons.arrow_forward_ios_rounded
    },
    {
      'image': AssetPath.privacy,
      'title': 'Privacy',
      'icon': Icons.arrow_forward_ios_rounded,
    },
    {
      'image': AssetPath.logout,
      'title': 'Logout',
      'color': AppColors.primaryColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Profile', isTrailingEnabled: false, centerTitle: false),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Image.asset(
                  AssetPath.org,
                  width: 132.w,
                ),
              ),
              Positioned(
                left: Get.width * 0.57,
                top: Get.height * 0.1,
                child: ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AssetPath.edit1,
                    height: 24.h,
                  ),
                ),
              ),
            ],
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
          SizedBox(height: 16.h),
          Divider(
            endIndent: 25.w,
            color: Color(0xFFEDF2F7),
            thickness: 1.5.h,
            indent: 20.w,
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemCount: proFile.length,
              itemBuilder: (context, index) {
                bool isLogout = proFile[index]['title'] == 'Logout';

                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.toNamed(AppRoute.organizerDetails);
                    } else if (index == 1) {
                      Get.toNamed(AppRoute.selectPaymentMethodScreen);
                    } else if (index == 2) {
                      Get.toNamed(AppRoute.privacyPolicy);
                    } else if (index == 3) {
                      showModalBottomSheet(
                        context: context,
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
                    leading: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isLogout ? AppColors.primaryColor : Colors.transparent,
                        BlendMode.srcATop,
                      ),
                      child: Image.asset(
                        proFile[index]['image'],
                        height: 30.h,
                      ),
                    ),
                    title: Text(
                      proFile[index]['title'],
                      style: GoogleFonts.inter(
                        fontWeight:
                            isLogout ? FontWeight.w500 : FontWeight.w400,
                        fontSize: 16.sp,
                        color: isLogout
                            ? AppColors.primaryColor
                            : Color(0xFF2D2D2D),
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
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

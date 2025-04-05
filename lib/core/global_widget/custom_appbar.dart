import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../utils/asset_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isTrailingEnabled;
  final String? iconPath;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.isTrailingEnabled,
    this.iconPath,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset(AssetPath.backBtn),
          ),
        ),
        centerTitle: centerTitle ?? true,
        title: Text(
          title,
          style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGrey),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // OnPressed Effect
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: isTrailingEnabled!
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        width: 24.w,
                        height: 24.h,
                        child: Image.asset(
                          iconPath!,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : Container(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}

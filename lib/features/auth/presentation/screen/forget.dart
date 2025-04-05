import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_event/core/global_widget/custom_btn.dart';
import 'package:party_event/features/auth/controller/dialog_controller/dialog_controller.dart';
import 'package:party_event/features/auth/presentation/screen/reset_password.dart';
import '../../../../core/global_widget/custom_botton1.dart';
import '../../../../core/utils/asset_path.dart';

class Forget extends StatelessWidget {
  Forget({super.key});

  final DialogController dialogController = Get.put(DialogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Image.asset(AssetPath.appleadin),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A202C)),
            ),
            Text(
              "Select with contact details should we use\nto reset yout password",
              style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF718096C)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Obx(
                  () => CustomButton1(
                    containerColor: dialogController.selectedIndex.value == 0
                        ? Color(0xFFD2F3C3)
                        : Color(0xFF71809633).withOpacity(0.2),
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.email_outlined,
                        size: 16.sp,
                        color: dialogController.selectedIndex.value == 0
                            ? Color(0xFF74DB47)
                            : Color(0xFF1A202C),
                      ),
                    ),
                    borderColor: dialogController.selectedIndex.value == 0
                        ? Color(0xFF74DB47)
                        : Color(0xFFE2E8F0),
                    borderWidth: 1.0,
                    title: "********@mail.com",
                    textColor: dialogController.selectedIndex.value == 0
                        ? Color(0xFF74DB47)
                        : Color(0xFF718096),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    onTap: () {
                      dialogController.selectIndex(0);
                    },
                    backgroundColor: dialogController.selectedIndex.value == 0
                        ? Color(0xFFE8F9E1)
                        : Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Obx(
                  () => CustomButton1(
                    containerColor: dialogController.selectedIndex.value == 1
                        ? Color(0xFFD2F3C3)
                        : Color(0xFF71809633).withOpacity(0.2),
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        size: 16.sp,
                        color: dialogController.selectedIndex.value == 1
                            ? Color(0xFF74DB47)
                            : Color(0xFF1A202C),
                      ),
                    ),
                    borderColor: dialogController.selectedIndex.value == 1
                        ? Color(0xFF74DB47)
                        : Color(0xFFE2E8F0),
                    borderWidth: 1.0,
                    title: "**** **** 24517",
                    textColor: dialogController.selectedIndex.value == 1
                        ? Color(0xFF74DB47)
                        : Color(0xFF718096),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    onTap: () {
                      dialogController.selectIndex(1);
                    },
                    backgroundColor: dialogController.selectedIndex.value == 1
                        ? Color(0xFFE8F9E1)
                        : Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomBtn(
              text: "Continue",
              onPressed: () {
                Get.to(() => ResetPassword(
                      selectedMethod: dialogController.selectedIndex.value == 0
                          ? "email"
                          : "phone",
                    ));
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
